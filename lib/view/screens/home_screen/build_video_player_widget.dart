import 'package:cloud_mm_vdo_short/controller/home_controller.dart';
import 'package:cloud_mm_vdo_short/view/screens/home_screen/video_player_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:video_player/video_player.dart';

import '../../../util/font_and_margin.dart';
import '../../reusable_widget/text_view.dart';
import 'build_profile_with_follow.dart';

class BuildVideoPlayerWidget extends StatelessWidget {
  final HomeController homeViewModel;
  final int index;

  const BuildVideoPlayerWidget(
      {Key? key, required this.homeViewModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: homeViewModel.controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: homeViewModel.controller.value.aspectRatio,
                  // child: VideoPlayer(homeViewModel.mVideoList[index],
                  child: VideoPlayerItem(
                    videoUrl: homeViewModel.mVideoList[index],
                  ),
                )
              : Container(),
        ),
        Positioned(
            right: 20,
            bottom: 80,
            child: BuildProfileWithFollow(
              homeViewModel: homeViewModel,
            )),
        Positioned(
          right: 80.w,
          left: 10.w,
          bottom: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                title: "@j Killer MM",
                fontSize: kLargeFont16.sp,
                textColor: Theme.of(context).colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: kDefaultMarginHeight.h,
              ),
              TextView(
                title:
                    "Provides many customizations including custom scroll directions, durations, curves as",
                maxLine: 3,
                fontSize: kMediumFont14.sp,
                textColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              SizedBox(
                height: kDefaultMarginHeight.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}
