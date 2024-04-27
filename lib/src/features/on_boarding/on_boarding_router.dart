import 'package:flutter/material.dart';
import 'package:health_care/src/features/on_boarding/presentation/on_boarding_screen/on_boarding_screen.dart';
import 'package:health_care/src/features/on_boarding/presentation/on_boarding_screen/on_boarding_screen_controller.dart';
import 'package:provider/provider.dart';

// this class is responsible for managing the on boarding feature routing.
abstract class OnBoardingRouter {
  static const String onBoardingScreen = '/on-boarding-OnBoardingScreen';

  // router.
  static Route<dynamic> router({
    required String screenName,
    required dynamic args,
  }) {
    if (screenName == onBoardingScreen) {
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<OnBoardingScreenController>(
          create: (_) => OnBoardingScreenController(),
          child: const OnBoardingScreen(),
        ),
        settings: const RouteSettings(name: onBoardingScreen),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('on-boarding route is not found'),
            ),
          );
        },
      );
    }
  }
}
