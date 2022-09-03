import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

enum PortalType {
  space,
  dark,
  language,
  setting,
  about,
  feedback,
  unlogined,
  userinfo,
  userstat,
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
        PortalType.language.instanceName: PortalType.language,
        PortalType.setting.instanceName: PortalType.setting,
        PortalType.about.instanceName: PortalType.about,
        PortalType.feedback.instanceName: PortalType.feedback,
        PortalType.unlogined.instanceName: PortalType.unlogined,
        PortalType.userinfo.instanceName: PortalType.userinfo,
        PortalType.userstat.instanceName: PortalType.userstat,
        PortalType.weibo.instanceName: PortalType.weibo,
        PortalType.qqGroup.instanceName: PortalType.qqGroup,
        PortalType.appinfo.instanceName: PortalType.appinfo,
      }[value] ??
      PortalType.space;
}

class Portal extends HiPortal {
  const Portal({
    super.id,
    super.icon,
    super.title,
    super.detail,
    super.color,
    super.height = 50,
    super.indicated = true,
    super.separated = true,
  });

  factory Portal.fromJson(Map<String, dynamic> json) => Portal(
        id: hiString(json['id']),
        icon: json['icon'] as String?,
        title: json['title'] as String?,
        detail: json['detail'] as String?,
        color: json['color'] as String?,
        height: hiDouble(json['height']) ?? 50,
        indicated: json['indicated'] as bool? ?? true,
        separated: json['separated'] as bool? ?? true,
      );

  @override
  Widget cell<M extends HiModel>(HiModelCallback<M>? callback) {
    return HiPortalCell2(
      portal: this,
      onPressed: () {
        if (callback == null) {
          return;
        }
        callback(this as M);
      },
    );
  }
}
