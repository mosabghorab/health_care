import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/src/core/networking/api_constants.dart';
import 'package:health_care/src/core/networking/custom_interceptor.dart';
import 'package:health_care/src/core/networking/dio_factory.dart';
import 'package:health_care/src/core/shared_pref/shared_pref_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DependencyInjection {
  static final _getIt = GetIt.instance;

  static Future<void> init() async {
    late final Dio dio = DioFactory.init();

    // register shared pref manager.
    final SharedPrefManager sharedPreferencesManager =
        await SharedPrefManager.init();
    _getIt.registerLazySingleton<SharedPrefManager>(
        () => sharedPreferencesManager);
  }

  // get.
  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
