import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/generated/l10n.dart';
import 'package:hi_github/provider/user_db_provider.dart';
import 'package:path_provider/path_provider.dart';

import '../model/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _login,
              child: const Text(
                '登录',
                style: TextStyle(fontSize: 22),
              ),
            ),
            InkWell(
              onTap: _about,
              child: const Text(
                '关于',
                style: TextStyle(fontSize: 22),
              ),
            ),
            InkWell(
              onTap: _login,
              child: const Text(
                '弹窗',
                style: TextStyle(fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }

  _login() async {
    HiRouter.shared().present(context, HiRouterPath.login);
  }

  void _about() async {
    // var user = User.fromJson(const {
    //   'node_id': 'abc123',
    //   'login': 'tospery'
    // });
    // var aaa = json.encode(user.toJson());
    // var bbb = user.toString();
    // log('bbb = $bbb');
    // var ccc = user.toJson().toString();
    // log('ccc = $ccc');

    // UserDbProvider provider = UserDbProvider();
    // var aaa = await provider.getObject('tospery');
    // log('aaa = $aaa');
    // await provider.save('tospery', json.encode(user.toJson()));
    // var bbb = await provider.getObject('tospery');
    // log('bbb = $bbb');
    // var path = await getApplicationDocumentsDirectory();
    // log('path = $path');
  }


}
