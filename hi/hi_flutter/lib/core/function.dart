import 'dart:math';
import 'package:flutter/material.dart';

Color get hiRandomColor {
  return Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1,
  );
}

String? hiString(dynamic any) {
  var result = any.toString();
  print('hiString的输入值: $any => $result');
  return result;

// 采用 is 先进行判断
  // String? string = any as String?;
  // print('hiString的输入值1: $string');
  // if (string != null) {
  //   return string;
  // }
  // int? number = any as int?;
  // print('hiString的输入值2: $number');
  // if (number != null) {
  //   return number.toString();
  // }
  // bool? boolValue = any as bool?;
  // print('hiString的输入值3: $boolValue');
  // if (boolValue != null) {
  //   return boolValue.toString();
  // }
  // return null;
}
