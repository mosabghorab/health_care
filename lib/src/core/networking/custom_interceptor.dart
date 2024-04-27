import 'package:dio/dio.dart';
import 'package:health_care/src/core/di/dependency_injection.dart';
import 'package:health_care/src/core/enums.dart';
import 'package:health_care/src/core/helpers/utils.dart';
import 'package:health_care/src/core/routing/navigation_manager.dart';
import 'package:health_care/src/core/shared_pref/shared_pref_manager.dart';
import 'package:health_care/src/features/auth/auth_router.dart';

class CustomInterceptor extends Interceptor {
  // on response.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // handle session expiration here.
    if (response.statusCode != null && response.statusCode == 401) {
      N.offAllNamed(AuthRouter.signInScreen);
      DependencyInjection.get<SharedPrefManager>().clearUserData();
      Utils.showMessage(
          message: 'Your session is expired , please sign in again',
          messageType: MessageType.failure);
      handler.resolve(response.data);
    }
    return super.onResponse(response, handler);
  }
}
