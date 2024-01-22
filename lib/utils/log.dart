import 'package:flutter/foundation.dart';

class Log {
  static void v(String message, {String tag = 'VERBOSE'}) {
    if (!kReleaseMode) {
      print('$tag: $message');
    }
  }

  static void d(String message, {String tag = 'DEBUG'}) {
    if (!kReleaseMode) {
      print('$tag: $message');
    }
  }

  static void i(String message, {String tag = 'INFO'}) {
    if (!kReleaseMode) {
      print('$tag: $message');
    }
  }

  static void w(String message, {String tag = 'WARN'}) {
    if (!kReleaseMode) {
      print('$tag: $message');
    }
  }

  static void e(String message, {String tag = 'ERROR'}) {
    if (!kReleaseMode) {
      print('$tag: $message');
    }
  }
}