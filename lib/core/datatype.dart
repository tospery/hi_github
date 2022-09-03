import 'package:hi_flutter/hi_flutter.dart';

enum PortalType {
  space,
  dark,
  userBriefJob,
  userBriefLocation,
  userBriefEmail,
  userBriefBlog,
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
        PortalType.dark.instanceName: PortalType.dark,
        PortalType.userBriefJob.instanceName: PortalType.userBriefJob,
        PortalType.userBriefLocation.instanceName: PortalType.userBriefLocation,
        PortalType.userBriefEmail.instanceName: PortalType.userBriefEmail,
        PortalType.userBriefBlog.instanceName: PortalType.userBriefBlog,
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
