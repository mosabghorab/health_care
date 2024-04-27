import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/src/core/enums.dart';
import 'package:health_care/src/core/helpers/utils.dart';

class FlashMessageWidget extends StatelessWidget {
  final FlashController flashController;
  final MessageType messageType;
  final String message;

  const FlashMessageWidget({
    super.key,
    required this.flashController,
    required this.messageType,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: SizedBox(
        width: 120.w,
        child: Flash(
          controller: flashController,
          // margin: EdgeInsets.only(
          //   top: 20.h,
          //   left: 10.w,
          //   right: 10.w,
          // ),
          // borderRadius: BorderRadius.circular(
          //   8.r,
          // ),
          // boxShadows: kElevationToShadow[8],
          // backgroundColor:
          //     messageType == MessageType.success ? Colors.green : Colors.red,
          // onTap: () => flashController.dismiss(),
          forwardAnimationCurve: Curves.bounceInOut,
          reverseAnimationCurve: Curves.easeIn,
          // alignment: AlignmentDirectional.topEnd,
          child: FlashBar(
            content: Text(
              message,
              style: TextStyle(
                // fontFamily: Helpers.getFontFamily(),
                fontSize: 4.sp,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              messageType == MessageType.success ? Icons.check : Icons.error,
              color: Colors.white,
            ),
            primaryAction: TextButton(
              onPressed: () => flashController.dismiss(),
              child: Text(
                'DISMISS',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Utils.getFontFamily(),
                ),
              ),
            ),
            controller: flashController,
          ),
        ),
      ),
    );
  }
}
