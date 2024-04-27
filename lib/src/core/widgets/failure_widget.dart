import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FailureWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTryAgainTapped;

  const FailureWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onTryAgainTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.network(
          'https://lottie.host/6192c810-9d2c-430e-b056-7ac80b90cea3/d3YPibrKqy.json',
          height: 120.h,
          repeat: false,
        ),
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
        10.verticalSpace,
        SizedBox(
          width: 50.w,
          child: ElevatedButton(
            onPressed: onTryAgainTapped,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16.h),
              backgroundColor: Colors.red.shade800,
            ),
            child: Text(
              'Try Again',
              style: TextStyle(
                fontSize: 4.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
