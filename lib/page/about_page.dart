import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../extension/hi_portal.dart';

class AboutPage extends HiPortalPage {
  const AboutPage({super.key, super.parameters = const {}});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends HiPortalPageState {
  @override
  void init() {
    super.init();
    path = parameters.stringForKey(HiParameter.path) ??
        'res/jsons/about_portals.json';
  }

  @override
  Widget buildCard(HiPortal portal) {
    return portal.cell(doPressed);
  }

  @override
  void doPressed(HiPortal portal) async {
    // var result = PortalType.about.stringValue;
    // log('看看结果: $result');
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    // String version = packageInfo.version;
    // String buildNumber = packageInfo.buildNumber;
    // log('appName: $appName');
    // log('appName: $packageName');
    // log('appName: $version');
    // log('appName: $buildNumber');
  }
}
