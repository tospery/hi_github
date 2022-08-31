import 'package:hi_flutter/hi_flutter.dart';

class AboutPage extends HiPortalPage {
  AboutPage({super.key, required Map<String, dynamic> parameters})
      : super(
          parameters: <String, dynamic>{
                HiParameter.path: 'res/jsons/about_portals.json',
              } +
              parameters,
        );

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends HiPortalPageState {
  @override
  void doPressed(HiPortal portal) {}
}
