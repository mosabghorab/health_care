import 'package:health_care/src/core/shared_data.dart';

extension ThemingAndTranslation on String {
  // Color get th => SharedData.currentTheme[this] ?? Colors.red;
  String get tr => SharedData.appLocalization.translate(this) ?? this;
}

extension Conversion on String {
  // to num.
  num toNum() => num.tryParse(this) ?? 0;

  // to int.
  int toInt() => int.tryParse(this) ?? 0;

  // to double.
  double toDouble() => double.tryParse(this) ?? 0;
}
