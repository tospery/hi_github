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

  String? get routerPath {
    switch (this) {
      case PortalType.dark:
      case PortalType.appinfo:
      case PortalType.space:
        return null;
      case PortalType.unlogined:
        return HiHost.login;
      default:
        return instanceName;
    }
  }

  factory PortalType.fromValue(String value) =>
      {
        PortalType.space.instanceName: PortalType.space,
        PortalType.dark.instanceName: PortalType.dark,
        PortalType.setting.instanceName: PortalType.setting,
        PortalType.about.instanceName: PortalType.about,
        PortalType.feedback.instanceName: PortalType.feedback,
        PortalType.unlogined.instanceName: PortalType.unlogined,
        PortalType.weibo.instanceName: PortalType.weibo,
        PortalType.qqGroup.instanceName: PortalType.qqGroup,
        PortalType.appinfo.instanceName: PortalType.appinfo,
      }[value] ??
      PortalType.space;
}
