import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isPhoneSize => width == width && height == height;
  double get appBarHeight => MediaQuery.of(this).padding.top + kToolbarHeight;
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  void hideKeyboard() {
    final currentScope = FocusScope.of(this);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}