enum PortalType {
  space,
  setting,
  about,
  feedback,
  unlogined,
  weibo,
  qqGroup,
  appinfo;

  String get stringValue => toString().split('.').last;

  String? get routerPath {
    if (this == PortalType.appinfo) {
      return null;
    }
    return stringValue;
  }

  factory PortalType.fromValue(String value) =>
      {
        PortalType.space.stringValue: PortalType.space,
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
