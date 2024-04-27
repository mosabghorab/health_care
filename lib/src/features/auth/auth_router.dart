import 'package:flutter/material.dart';
import 'package:health_care/src/features/auth/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:health_care/src/features/auth/presentation/sign_in_screen/sign_in_screen_controller.dart';
import 'package:provider/provider.dart';

// this class is responsible for managing the auth feature routing.
abstract class AuthRouter {
  static const String signInScreen = '/auth-SignInScreen';

  // router.
  static Route<dynamic> router({
    required String screenName,
    required dynamic args,
  }) {
    if (screenName == signInScreen) {
      return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<SignInScreenController>(
          create: (_) => SignInScreenController(),
          child: const SignInScreen(),
        ),
        settings: const RouteSettings(name: signInScreen),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('auth route is not found'),
            ),
          );
        },
      );
    }
  }
}
