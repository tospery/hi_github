import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../extension/build_context.dart';
import '../page/home_page.dart';

import 'personal_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final GlobalKey<HomePageState> homeKey = GlobalKey();
  //final GlobalKey<StarPageState> starKey = GlobalKey();
  final GlobalKey<PersonalPageState> personalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return HiTabBarPage(
      tabItems: [
        _renderTab(Icons.home, context.string.home),
        //_renderTab(Icons.star, context.string.star),
        _renderTab(Icons.account_circle, context.string.personal),
      ],
      tabViews: [
        HomePage(key: homeKey),
        //StarPage(key: starKey),
        PersonalPage(key: personalKey),
      ],
      backgroundColor: Colors.green,
      indicatorColor: Colors.transparent,
    );
  }

  _renderTab(icon, text) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(icon, size: 16.0), Text(text)],
      ),
    );
  }
}
