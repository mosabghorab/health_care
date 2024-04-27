import 'package:dio/dio.dart';

abstract class IApiAuthService {
  void signIn({required String phone});
}

class ApiAuthService implements IApiAuthService {
  late final Dio _dio;

  ApiAuthService(this._dio);

  // sign in
  @override
  void signIn({required String phone}) {
    // TODO: implement signIn
  }
}
