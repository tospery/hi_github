import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import 'package:hi_github/redux/app_state.dart';

import '../model/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // User? user;
  List<Portal> portals = [];

  @override
  void initState() {
    super.initState();
    // user = context.store.state.user;
    // log('user = $user');
  }

  @override
  Widget build(BuildContext context) {
    // var settings = context.settings;
    // var name = settings?.name;
    // var arguments = settings?.arguments;
    // log('settings = $settings, name = $name, arguments = $arguments');
    log('build');
    return StoreBuilder<APPState>(
      builder: (context, store) {
        _initData(store.state.user);
        return Scaffold(
          appBar: AppBar(
            title: Text(store.state.user?.login ?? ''),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 10),
            child: HiPortalListView(
              portals: portals,
            ),
          ),
        );
      },
    );
  }

  void _initData(User? user) {
    if (portals.isNotEmpty) {
      return;
    }
    portals.add(Portal(
      title: context.string.nickname,
      detail: user?.login ?? '',
    ));
    portals.add(Portal(
      title: context.string.bio,
      detail: user?.bio ?? '',
    ));
  }
}
