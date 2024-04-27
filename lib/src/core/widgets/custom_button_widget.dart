import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/src/core/styles/text_styles_constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool isBordered;
  final bool isLoading;

  const CustomButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.isBordered = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 12.h,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: isBordered
              ? Border.all(
                  color: backgroundColor ?? Theme.of(context).primaryColor)
              : null,
          color: isBordered
              ? null
              : backgroundColor ?? Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStylesConstant.font16WhiteSemiBold,
            ),
            if (isLoading) ...[
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                width: 15.h,
                height: 15.h,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
