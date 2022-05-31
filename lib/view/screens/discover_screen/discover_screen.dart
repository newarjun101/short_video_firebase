import 'package:cloud_mm_vdo_short/util/font_and_margin.dart';
import 'package:cloud_mm_vdo_short/view/reusable_widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: TextView(title: 'Discover', fontSize: kLargeFont16.sp,),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Center(
        child: TextView(title: "Coming Soon",fontSize: kLargeFont16.sp,fontWeight: FontWeight.bold,),
      ),
    );
  }
}
