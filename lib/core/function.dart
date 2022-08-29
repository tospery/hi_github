import 'package:flutter/material.dart';
import 'package:hi_flutter/core/constant.dart';

ThemeData getThemeData(MaterialColor color) {
  return ThemeData(
    primarySwatch: color,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    backgroundColor: Colors.red,
    scaffoldBackgroundColor: Colors.grey[200],
    appBarTheme: const AppBarTheme(
      elevation: 0.5,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.orange,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(Colors.black54),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.orange,
    ),
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: HiConstant.normalFontSize,
        color: Colors.black,
      ),
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.green,
    //   // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
    //   //   systemNavigationBarContrastEnforced: true,
    //   //   systemStatusBarContrastEnforced: true,
    //   //   systemNavigationBarColor: Colors.white,
    //   //   statusBarColor: color,
    //   //   systemNavigationBarDividerColor: Colors.green,
    //   // ),
    // ),
    // 如果需要去除对应的水波纹效果
    // splashFactory: NoSplash.splashFactory,
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
    // ),
  );
}
