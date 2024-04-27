import 'package:flutter/material.dart';
import 'package:health_care/src/features/auth/auth_router.dart';
import 'package:health_care/src/features/on_boarding/on_boarding_router.dart';

// this class is responsible for managing the routing stuff for the app.
abstract class AppRouter {
  // on generate route.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final String screenName = settings.name!;
    late final dynamic screenArgs = settings.arguments;
    // check the coming screen is belong to what feature and connect it to its router.
    if (screenName.startsWith('/auth-')) {
      return AuthRouter.router(screenName: screenName, args: screenArgs);
    } else if (screenName.startsWith('/on-boarding-')) {
      return OnBoardingRouter.router(screenName: screenName, args: screenArgs);
    } else {
      return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('route ${settings.name} is not found'),
            ),
          );
        },
      );
    }
  }
}
