import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyContentWidget extends StatelessWidget {
  final String title;
  final String description;

  const EmptyContentWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.network(
          'https://lottie.host/618bc1c2-a518-4f0c-8458-18ed7aadc544/TiMDZhjmPt.json',
          height: 150.h,
        ),
        5.verticalSpace,
        Text(
          title,
          style: TextStyle(
            fontSize: 5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        5.verticalSpace,
        Text(
          description,
          style: TextStyle(
            fontSize: 4.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
