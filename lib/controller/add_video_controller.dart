import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class AddVideoController extends ChangeNotifier {
  late dynamic video = "";
  bool hasVideo = false;
  bool isLoading = false;
  late VideoPlayerController controller;
  FirebaseStorage storage = FirebaseStorage.instance;
  final fireStore = FirebaseFirestore.instance;

  pickVideo(ImageSource src) async {
    video = await ImagePicker().pickVideo(source: src);
    if (video != "") {
      controller = VideoPlayerController.file(File(video.path));
      hasVideo = true;
      controller.initialize();
      controller.play();
      controller.setVolume(1);
      controller.setLooping(true);
    }
    notifyListeners();
  }

  Future<void> upload({String? description, context}) async {
    isLoading = true;
    showDialog(
      context: context,
      builder: (_) {
        return const Expanded(
          child: SimpleDialog(
            title: Center(child: Text('Loading')),
            children: [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        );
      },
    );
    try {
      File videoFile = File(video.path);

      try {
        // Uploading the selected image with some custom meta data
        TaskSnapshot snapshot = await storage
            .ref()
            .child("videos/${Uuid().v4()}")
            .putFile(
                videoFile,
                SettableMetadata(customMetadata: {
                  'uploaded_by': 'AnonyMouse',
                  'description': 'Some description...'
                }));
        isLoading = false;
        if (snapshot.state == TaskState.success) {
          isLoading = false;
          final String downloadUrl = await snapshot.ref.getDownloadURL();
          await fireStore
              .collection("videos")
              .add({"url": downloadUrl, "name": "imageName"});

          video = "";
          hasVideo = false;
        } else {}

        // Refresh the UI
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print("aj $error");
          isLoading = false;
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print("khushboo $err");
        isLoading = false;
      }
    }
    Get.back();
    notifyListeners();
  }

  Future<void> getVideo() async {
    print("testing");
    QuerySnapshot data = await fireStore.collection("videos").get();

    final allData = data.docs.map((doc) => doc.data()).toList();
    print(allData);
  }

  deleteVideo() {

    video = "";
    hasVideo = false;
    notifyListeners();
  }

}
