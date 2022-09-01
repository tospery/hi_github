import 'package:hi_flutter/hi_flutter.dart';

enum PortalType {
  space,
  dark,
  setting,
  about,
  feedback,
  unlogined,
  weibo,
  qqGroup,
  appinfo;

  String get stringValue => toString().split('.').last;

  String? get routerPath {
    switch (this) {
      case PortalType.dark:
      case PortalType.appinfo:
      case PortalType.space:
        return null;
      case PortalType.unlogined:
        return HiPath.login;
      default:
        return stringValue;
    }
  }

  factory PortalType.fromValue(String value) =>
      {
        PortalType.space.stringValue: PortalType.space,
        PortalType.dark.stringValue: PortalType.dark,
        PortalType.setting.stringValue: PortalType.setting,
        PortalType.about.stringValue: PortalType.about,
        PortalType.feedback.stringValue: PortalType.feedback,
        PortalType.unlogined.stringValue: PortalType.unlogined,
        PortalType.weibo.stringValue: PortalType.weibo,
        PortalType.qqGroup.stringValue: PortalType.qqGroup,
        PortalType.appinfo.stringValue: PortalType.appinfo,
      }[value] ??
      PortalType.space;
}
