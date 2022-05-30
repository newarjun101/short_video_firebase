import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_mm_vdo_short/controller/home_controller.dart';
import 'package:cloud_mm_vdo_short/util/font_and_margin.dart';
import 'package:cloud_mm_vdo_short/view/reusable_widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class BuildProfileWithFollow extends StatelessWidget {

  final HomeController homeViewModel;
  const BuildProfileWithFollow({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_960_720.jpg",
          imageBuilder: (context, imageProvider) => Container(
            width: 0.074.sh,
            padding: const EdgeInsets.all(2),
            height: 0.074.sh,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border:
                  Border.all(color: Theme.of(context).colorScheme.secondary),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => SizedBox(
              height: 30.h,
              width: 30.h,
              child: const CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(
            Icons.account_circle_outlined,
            size: 43.h,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        SizedBox(
          height: kDefaultMarginHeight * 2.h,
        ),
        Icon(
          Icons.favorite,
          size: 24.sp,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        SizedBox(
          height: kDefaultMarginHeight.h,
        ),
        TextView(
          title: "56.2M",
          fontSize: kSmallFont12.sp,
          textColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        SizedBox(
          height: kDefaultMarginHeight * 2.h,
        ),
        Icon(
          Icons.message_rounded,
          size: 24.sp,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        SizedBox(
          height: kDefaultMarginHeight.h,
        ),
        TextView(
          title: "200.1K",
          fontSize: kSmallFont12.sp,
          textColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        SizedBox(
          height: kDefaultMarginHeight * 2.h,
        ),
        CachedNetworkImage(
          imageUrl: "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_960_720.jpg",
          imageBuilder: (context, imageProvider) => Container(
            width: 0.074.sh,
            padding: const EdgeInsets.all(2),
            height: 0.074.sh,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border:
              Border.all(color: Theme.of(context).colorScheme.secondary),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => SizedBox(
              height: 30.h,
              width: 30.h,
              child: const CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(
            Icons.account_circle_outlined,
            size: 43.h,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ],
    );
  }
}
