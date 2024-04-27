import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care/src/core/di/dependency_injection.dart';
import 'package:health_care/src/core/routing/navigation_manager.dart';
import 'package:health_care/src/core/widgets/app_widget/app_widget.dart';
import 'package:health_care/src/core/widgets/app_widget/app_widget_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  N.init();
  await DependencyInjection.init();
  // for previewing the app on multi screen sizes.
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => ChangeNotifierProvider<AppWidgetController>(
        create: (_) => AppWidgetController(),
        child: const AppWidget(),
      ),
    ),
  );
}
