import 'package:flutter/material.dart';
import '../core/user.dart';

class HiAPPState {
  bool login;
  HiUser? user;
  Locale? locale;
  ThemeData? themeData;

  HiAPPState({this.login = false, this.user, this.locale, this.themeData});
}
