import 'package:flutter/material.dart';
import 'package:health_care/src/core/enums.dart';
import 'package:health_care/src/core/localization/app_localization.dart';
import 'package:health_care/src/features/auth/data/models/entities/user.dart';

abstract class SharedData {
  // current user.
  static User? currentUser;

  // app opened by.
  static AppOpenedBy appOpenedBy = AppOpenedBy.user;

  // navigation key.
  static GlobalKey<NavigatorState>? navigationKey;

  // localization.
  static late AppLocalizations appLocalization;
}
