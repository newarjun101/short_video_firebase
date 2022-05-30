import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class HomeController extends ChangeNotifier {
  late VideoPlayerController controller;

  List<String> mVideoList = [];
  final fireStore = FirebaseFirestore.instance;

  bool isLoading = false;

  int number = 0;

  HomeController() {
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      });
  }

  Future<void> getVideo() async {
    isLoading = true;
    print("testing");
    QuerySnapshot data = await fireStore.collection("videos").get();

    try {
      QuerySnapshot data = await fireStore.collection("videos").get();
      mVideoList = data.docs
          .map((doc) => doc["url"].toString())
          .toList();
      isLoading = false;
    } on FirebaseException catch (error) {
      print("error");
      isLoading = false;
    } catch (e) {
      print("hahah");
      isLoading = false;
    }

    //  final allData = data.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }
}
