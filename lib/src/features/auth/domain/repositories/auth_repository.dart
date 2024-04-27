import 'package:health_care/src/features/auth/data/data_sources/remote/api/api_auth_service.dart';

abstract class IAuthRepository {
  void signIn({required String phone});
}

class AuthRepository implements IAuthRepository {
  late final ApiAuthService _authApiDataSource;

  AuthRepository(this._authApiDataSource);

  // sign in.
  @override
  void signIn({required String phone}) {
    // TODO: implement signIn
  }
}
