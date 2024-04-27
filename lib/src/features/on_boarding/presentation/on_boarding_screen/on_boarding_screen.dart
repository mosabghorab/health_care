import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/src/core/assets/assets_constants.dart';
import 'package:health_care/src/core/styles/text_styles_constants.dart';
import 'package:health_care/src/core/widgets/custom_button_widget.dart';
import 'package:health_care/src/features/on_boarding/presentation/on_boarding_screen/on_boarding_screen_controller.dart';
import 'package:health_care/src/features/on_boarding/presentation/on_boarding_screen/widgets/doctor_image_with_text_widget.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller.
  late final OnBoardingScreenController _onBoardingScreenController =
      context.read<OnBoardingScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsConstants.logoImage,
                        height: 40.h,
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  const DoctorImageWithTextWidget(),
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      textAlign: TextAlign.center,
                      style: TextStylesConstant.font10BlueNormal,
                    ),
                  ),
                  15.verticalSpace,
                  CustomButtonWidget(
                    onTap: _onBoardingScreenController.navigateToSignInScreen,
                    title: 'Get Started',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
