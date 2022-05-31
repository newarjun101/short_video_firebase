import 'package:cloud_mm_vdo_short/util/font_and_margin.dart';
import 'package:cloud_mm_vdo_short/view/reusable_widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../algorithm_test/test_data.dart';
import '../../../algorithm_test/raw_node.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
      onTap: () {
        final uniqueOne = TreeItems().search(treeOne);
        final uniqueTwo = TreeItems().search(treeTwo);
        final answer =
            uniqueOne.where((element) => !uniqueTwo.contains(element));
        answer.forEach(print);
      },
      child: TextView(
        fontSize: kLargeFont16.sp,
        title: 'Test Node',
      ),
    )));
  }
}
