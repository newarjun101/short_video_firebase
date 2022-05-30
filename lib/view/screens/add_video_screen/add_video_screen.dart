import 'package:cloud_mm_vdo_short/di/locator.dart';
import 'package:cloud_mm_vdo_short/util/font_and_margin.dart';
import 'package:cloud_mm_vdo_short/view/reusable_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../controller/add_video_controller.dart';
import '../../reusable_widget/text_view.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addVideoController = locator.get<AddVideoController>();
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => addVideoController,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<AddVideoController>(builder: (_, addVideoCtl, __) {
                return addVideoCtl.hasVideo == false
                    ? const TextView(title: "NO Vidoe", fontSize: kMediumFont14)
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: VideoPlayer(addVideoController.controller),
                      );
              }),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                buttonColor: Theme.of(context).errorColor,
                buttonText: "Delete Video",
                onClick: () => addVideoController.deleteVideo(),
                buttonTextColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              Consumer<AddVideoController>(builder: (_, addVideoCtl, __) {
                return CustomButton(
                  buttonColor: Theme.of(context).errorColor,
                  buttonText: addVideoCtl.hasVideo == false
                      ? 'Add Video'
                      : "Upload Video",
                  onClick: () {
                    if (addVideoCtl.hasVideo == true) {
                      addVideoController.upload(context : context);

                    } else {
                      showOptionsDialog(context, addVideoController);
                    }
                  },
                  buttonTextColor:
                      Theme.of(context).colorScheme.primaryContainer,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

showOptionsDialog(BuildContext context, AddVideoController addVideoController) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () {
            Get.back();
            addVideoController.pickVideo(ImageSource.gallery);
          },
          child: Row(
            children: [
              const Icon(Icons.image),
              Padding(
                  padding: EdgeInsets.all(7.0),
                  child: TextView(
                    title: 'Gallery',
                    fontSize: kLargeFont16.sp,
                  )),
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Get.back();
            addVideoController.pickVideo(ImageSource.camera);
          },
          child: Row(
            children: [
              const Icon(Icons.camera_alt),
              Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextView(
                    title: 'Camera',
                    fontSize: kLargeFont16.sp,
                  )),
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: () => Get.back(),
          child: Row(
            children: [
              const Icon(Icons.cancel),
              Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextView(
                    title: 'Cancel',
                    fontSize: kLargeFont16.sp,
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
