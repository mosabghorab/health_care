import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/src/core/di/dependency_injection.dart';
import 'package:health_care/src/core/enums.dart';
import 'package:health_care/src/core/shared_data.dart';
import 'package:health_care/src/core/shared_pref/shared_pref_manager.dart';
import 'package:health_care/src/core/widgets/confirmation_widget.dart';
import 'package:health_care/src/core/widgets/flash_message_widget.dart';
import 'package:health_care/src/core/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Utils {
  // show message.
  static void showMessage({
    required String message,
    required MessageType messageType,
  }) {
    showFlash(
      context: SharedData.navigationKey!.currentContext!,
      duration: const Duration(seconds: 3),
      builder: (_, controller) {
        return FlashMessageWidget(
          flashController: controller,
          message: message,
          messageType: messageType,
        );
      },
    );
  }

  // shortcut for showing bottom sheet.
  static Future bottomSheet({
    required Widget child,
    Color? backgroundColor,
    int radius = 8,
    bool isScrollControlled = true,
  }) async {
    return await showModalBottomSheet(
      context: SharedData.navigationKey!.currentContext!,
      builder: (_) => child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
    );
  }

  // shortcut for showing a dialog.
  static Future showADialog({
    required Widget child,
  }) async {
    return await showDialog(
      context: SharedData.navigationKey!.currentContext!,
      builder: (_) => child,
    );
  }

  // shortcut for showing a loading.
  static void showLoading({
    String? title,
  }) {
    showDialog(
      context: SharedData.navigationKey!.currentContext!,
      builder: (_) => LoadingWidget(
        title: title,
      ),
      barrierDismissible: false,
    );
  }

  // show confirmation.
  static void showConfirmation({
    required final String title,
    required final String description,
    required final String confirmationText,
    required final VoidCallback onConfirm,
    final Color? confirmationTextColor,
  }) {
    showDialog(
      context: SharedData.navigationKey!.currentContext!,
      builder: (_) => ConfirmationWidget(
        title: title,
        description: description,
        confirmationText: confirmationText,
        onConfirm: onConfirm,
        confirmationTextColor: confirmationTextColor,
      ),
    );
  }

  // check if the user is signed in or not.
  // static bool checkAuth({
  //   required BuildContext context,
  // }) {
  //   if (AppSharedData.currentUser == null) {
  //     showConfirmationDialog(
  //       context: context,
  //       description: 'You are not signed in to make this action'.tr,
  //       confirmText: 'Sign In'.tr,
  //       onConfirm: () {
  //         N.offAllNamed(Constants.screensLandingScreen);
  //       },
  //     );
  //   }
  //   return AppSharedData.currentUser != null;

  // open location on google map app.
  static void openLocationOnGoogleMapApp({
    required double lat,
    required double lng,
  }) async {
    try {
      String mapSchema = Platform.isAndroid
          ? 'https://www.google.com/maps/search/?api=1&query=$lat,$lng'
          // ? 'geo:$lat,$long'
          : 'https://maps.apple.com/?q=$lat,$lng';
      await launchUrl(Uri.parse(mapSchema));
    } catch (error) {
      debugPrint("couldn't launch the google map: $error");
      Utils.showMessage(
          message: "couldn't launch the google map",
          messageType: MessageType.failure);
    }
  }

  // get current font family.
  static String getFontFamily() =>
      DependencyInjection.get<SharedPrefManager>().getLocale() == 'en'
          ? 'poppins'
          : 'montserrat-arabic';
}
