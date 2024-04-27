import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/src/core/constants.dart';
import 'package:health_care/src/core/di/dependency_injection.dart';
import 'package:health_care/src/core/localization/app_localization.dart';
import 'package:health_care/src/core/routing/app_router.dart';
import 'package:health_care/src/core/shared_data.dart';
import 'package:health_care/src/core/shared_pref/shared_pref_manager.dart';
import 'package:health_care/src/core/themeing/app_theme.dart';
import 'package:health_care/src/features/on_boarding/on_boarding_router.dart';
import 'package:provider/provider.dart';

import 'app_widget_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AppWidgetController, bool>(
      selector: (_, value) => value.nApp,
      builder: (_, nApp, __) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode:
              DependencyInjection.get<SharedPrefManager>().isDarkModeEnabled()
                  ? ThemeMode.dark
                  : ThemeMode.light,
          locale:
              Locale(DependencyInjection.get<SharedPrefManager>().getLocale()),
          builder: DevicePreview.appBuilder,
          supportedLocales:
              Constants.supportedLocales.keys.map((locale) => Locale(locale)),
          navigatorKey: SharedData.navigationKey,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: Constants.appName,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: OnBoardingRouter.onBoardingScreen,
        ),
      ),
    );
  }
}
