import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/src/core/styles/colors_constant.dart';
import 'package:health_care/src/core/styles/font_weight_constants.dart';

abstract class TextStylesConstant {
  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightConstants.bold,
    color: ColorsConstants.mainBlue,
  );

  static TextStyle font10BlueNormal = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightConstants.regular,
    color: ColorsConstants.gray,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightConstants.semiBold,
    color: Colors.white,
  );
}
