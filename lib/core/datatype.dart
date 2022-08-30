import 'package:hi_flutter/hi_flutter.dart';

enum PortalType {
  setting,
  about,
  feedback,
  unlogined;

  String get value => {
        setting: 'setting',
        about: 'about',
        feedback: 'feedback',
        unlogined: 'unlogined',
      }[this]!;

  String get path => {
        setting: HiRouterPath.about,
        about: HiRouterPath.about,
        feedback: HiRouterPath.about,
        unlogined: HiRouterPath.login,
      }[this]!;

  factory PortalType.fromValue(String value) =>
      {
        'setting': PortalType.setting,
        'about': PortalType.about,
        'feedback': PortalType.feedback,
        'unlogined': PortalType.unlogined,
      }[value] ??
      PortalType.setting;
}
