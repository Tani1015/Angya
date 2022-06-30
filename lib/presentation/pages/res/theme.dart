//テーマ　ライトモードorダークモード
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:angya/gen/colors.gen.dart';

// #assets/color/colors.xmlで色の指定をし、gen_generator
// flutter packages pub run build_runner build
// fluttergen -c example/pubspec.yaml

ThemeData getAppTheme() {
  final base = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
  );
  return base.copyWith(
    primaryColor: ColorName.primary,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: ColorName.primary,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      iconTheme: base.iconTheme.copyWith(color: Colors.grey),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: ColorName.primary,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      backgroundColor: Colors.white,
      selectedItemColor: ColorName.primary,
      unselectedItemColor: Colors.black.withOpacity(0.4),
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: base.textTheme.bodyText2!.copyWith(
          fontSize: 15,
        ),
      ),
    ),
  );
}

ThemeData getAppThemeDark() {
  final base = ThemeData.from(
    useMaterial3: false,
    colorScheme: const ColorScheme.dark(),
  );
  return base.copyWith(
    primaryColor: ColorName.primary,
    colorScheme: base.colorScheme.copyWith(
      primary: ColorName.primary,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: ColorName.primary,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      iconTheme: base.iconTheme.copyWith(color: Colors.grey),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: ColorName.primary,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      selectedItemColor: ColorName.primary,
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: base.textTheme.bodyText2!.copyWith(
          fontSize: 15,
        ),
      ),
    ),
  );
}
