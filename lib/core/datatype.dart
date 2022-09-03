import 'package:hi_flutter/hi_flutter.dart';

enum PortalType {
  space,
  button,
  dark,
  nickname,
  bio,
  company,
  location,
  email,
  blog,
  language,
  setting,
  about,
  feedback,
  unlogined,
  userInfo,
  userChart,
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
        PortalType.button.instanceName: PortalType.button,
        PortalType.dark.instanceName: PortalType.dark,
        PortalType.nickname.instanceName: PortalType.nickname,
        PortalType.bio.instanceName: PortalType.bio,
        PortalType.company.instanceName: PortalType.company,
        PortalType.location.instanceName: PortalType.location,
        PortalType.email.instanceName: PortalType.email,
        PortalType.blog.instanceName: PortalType.blog,
        PortalType.language.instanceName: PortalType.language,
        PortalType.setting.instanceName: PortalType.setting,
        PortalType.about.instanceName: PortalType.about,
        PortalType.feedback.instanceName: PortalType.feedback,
        PortalType.unlogined.instanceName: PortalType.unlogined,
        PortalType.userInfo.instanceName: PortalType.userInfo,
        PortalType.userChart.instanceName: PortalType.userChart,
        PortalType.weibo.instanceName: PortalType.weibo,
        PortalType.qqGroup.instanceName: PortalType.qqGroup,
        PortalType.appinfo.instanceName: PortalType.appinfo,
      }[value] ??
      PortalType.space;
}
