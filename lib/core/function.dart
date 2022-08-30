import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

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
    primaryIconTheme: const IconThemeData(
      color: Colors.red,
    ),
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      // Card's title
      titleMedium: TextStyle(
        fontSize: HiConstant.normalFontSize - 1,
        color: Colors.black87,
      ),
      // Card's detail
      bodyMedium: TextStyle(
        fontSize: HiConstant.normalFontSize - 2,
        color: Colors.black54,
      ),
    ),
    cardTheme: const CardTheme(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 0.5,
      color: Colors.grey[200],
    ),
    indicatorColor: Colors.grey,
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
