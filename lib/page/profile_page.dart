import 'package:flutter/material.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HiPortalListView(
                  portals: portals,
                ),
                _buildLogoutItem(),
              ],
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
    portals.addAll([
      Portal(
        title: context.string.nickname,
        detail: user?.login ?? '',
      ),
      Portal(
        title: context.string.bio,
        detail: user?.bio ?? '',
        separator: false,
        spacer: 15,
      ),
      Portal(
        title: context.string.team,
        detail: user?.company ?? '',
      ),
      Portal(
        title: context.string.city,
        detail: user?.location ?? '',
      ),
      Portal(
        title: context.string.blog,
        separator: false,
        detail: user?.blog ?? '',
      ),
    ]);
  }

  Widget _buildLogoutItem() {
    return Container(
      height: 50,
      color: Colors.white,
      child: Center(
        child: InkWell(
          onTap: () {},
          child: Text(
            context.string.exitLogin,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.red,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
