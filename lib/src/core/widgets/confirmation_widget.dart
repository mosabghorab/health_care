import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/src/core/routing/navigation_manager.dart';

class ConfirmationWidget extends StatelessWidget {
  final String title;
  final String description;
  final String confirmationText;
  final VoidCallback onConfirm;
  final Color? confirmationTextColor;

  const ConfirmationWidget({
    super.key,
    required this.title,
    required this.description,
    required this.confirmationText,
    required this.onConfirm,
    this.confirmationTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      slidingBeginOffset: const Offset(0, -1),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: 120.w,
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 30.h,
                      height: 30.h,
                      child: TextButton(
                        onPressed: () {
                          N.back();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 15.h,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 4.sp,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                Column(
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: ElevatedButton(
                        onPressed: () {
                          N.back();
                          onConfirm();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20.h),
                          backgroundColor: confirmationTextColor ??
                              Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          confirmationText,
                          style: TextStyle(
                            fontSize: 4.sp,
                          ),
                        ),
                      ),
                    ),
                    5.verticalSpace,
                    TextButton(
                      onPressed: () {
                        N.back();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16.h),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 4.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
