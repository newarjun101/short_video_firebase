import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_mm_vdo_short/controller/bottom_nav_main_controller.dart';
import 'package:cloud_mm_vdo_short/controller/home_controller.dart';
import 'package:cloud_mm_vdo_short/di/locator.dart';
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
  bool isSuccess = false;
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
    isSuccess = false;
    showDialog(
      context: context,
      builder: (_) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          height: 150,
          child: const SimpleDialog(
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
          final String downloadUrl = await snapshot.ref.getDownloadURL();
          await fireStore
              .collection("videos")
              .add({"url": downloadUrl, "name": "imageName"});
          isLoading = false;
          isSuccess = true;
          videoFile.delete();

          controller.dispose();
          video = "";
          hasVideo = false;
        } else {
          isLoading = false;
        }
        locator.get<HomeController>().getVideo();
        locator.get<BottomNavMainController>().onNavBarItemTapped(0);
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

  deleteVideo() {
    controller.dispose();
    video = "";
    hasVideo = false;
    notifyListeners();
  }
}
