import 'package:flutter/material.dart';
import 'package:health_care/src/core/shared_data.dart';

// this class is responsible for navigation management.
abstract class N {
  // init.
  static void init() {
    SharedData.navigationKey = GlobalKey();
  }

  // same of push named.
  static Future<dynamic> toNamed(String routeName, {Object? arguments}) async {
    return SharedData.navigationKey!.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  // same of push and remove until named.
  static Future<dynamic> offAllNamed(String routeName,
      {Object? arguments}) async {
    return SharedData.navigationKey!.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  // same of push.
  static Future<T?> to<T extends Object?>(Route<T>? route) {
    return SharedData.navigationKey!.currentState!.push(route!);
  }

  // same of pop.
  static void back<T extends Object>([T? result]) {
    SharedData.navigationKey!.currentState!.pop(result);
  }

  // pop to the first route in the stack.
  static void backAll<T extends Object>([T? result]) {
    while (SharedData.navigationKey!.currentState!.canPop()) {
      SharedData.navigationKey!.currentState!.pop(result);
    }
  }

  // same of pop until.
  static void backUntil(RoutePredicate predicate) {
    SharedData.navigationKey!.currentState!.popUntil(predicate);
  }
}
