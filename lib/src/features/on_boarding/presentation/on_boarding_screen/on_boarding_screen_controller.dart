import 'package:flutter/cupertino.dart';
import 'package:health_care/src/core/routing/navigation_manager.dart';
import 'package:health_care/src/features/auth/auth_router.dart';

class OnBoardingScreenController with ChangeNotifier {
  // navigate to sign in screen.
  void navigateToSignInScreen() {
    N.toNamed(AuthRouter.signInScreen);
  }
}
