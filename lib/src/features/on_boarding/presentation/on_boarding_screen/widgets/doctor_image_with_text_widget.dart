import 'package:flutter/material.dart';
import 'package:health_care/src/core/assets/assets_constants.dart';
import 'package:health_care/src/core/styles/text_styles_constants.dart';

class DoctorImageWithTextWidget extends StatelessWidget {
  const DoctorImageWithTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AssetsConstants.logoLowOpacityImage,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
            ),
          ),
          child: Image.asset(
            AssetsConstants.doctorImage,
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          start: 0,
          child: Center(
            child: Text(
              'Best Doctor\nAppointment App',
              textAlign: TextAlign.center,
              style: TextStylesConstant.font32BlueBold,
            ),
          ),
        ),
      ],
    );
  }
}
