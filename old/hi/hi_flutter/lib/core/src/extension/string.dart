import 'package:flutter/material.dart';
import 'int.dart';
import 'dart:convert' as convert;

extension HiCoreStringEx on String {
  bool? toBool() {
    if (toLowerCase() == 'true') {
      return true;
    }
    if (toLowerCase() == 'false') {
      return false;
    }
    return toInt()?.toBool();
  }

  int? toInt() => int.tryParse(this);

  double? toDouble() => double.tryParse(this);

  // dynamic toJson() {
  //   return isNotEmpty ? convert.json.decode(this) : <String, dynamic>{};
  // }

  Color? toColor() {
    if (length < 7) {
      return null;
    }
    return Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);

    // Color(int.parse(c,radix:16)).withAlpha(255)
  }

  Uri? toUri() => Uri.tryParse(this);

  String toJsonString() => convert.json.encode(this);
  Map<String, dynamic> toJsonObject() {
    var json = convert.json.decode(this);
    if (json is! Map<String, dynamic>) {
      return {};
    }
    return json;
  }

  List<dynamic> toJsonArray() {
    var json = convert.json.decode(this);
    if (json is! List<dynamic>) {
      return [];
    }
    return json;
  }

  dynamic toJson() {
    var object = toJsonObject();
    if (object.isNotEmpty) {
      return object;
    }
    var array = toJsonArray();
    if (array.isNotEmpty) {
      return array;
    }
    return null;
  }
}