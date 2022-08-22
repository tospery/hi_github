import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';

import '../model/user.dart';
import '../redux/login_redux.dart';
import '../redux/user_redux.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isInited = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInited) {
      return;
    }
    isInited = true;
    Future.delayed(const Duration(seconds: 3), () {
      initStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.green,
      ),
    );
  }

  void initStore() {
    var token = HiCache.shared().get<String>(HiCacheKey.token);
    var user = User.fromJson(
        (HiCache.shared().get<String>(HiCacheKey.user) ?? '').jsonObject);
    if (user.isValid) {
      context.store.dispatch(UpdateUserAction(user));
    }
    if ((token?.isEmpty ?? true) || (user.isValid == false)) {
      context.store.dispatch(LogoutSuccessAction(context, false));
      return;
    }
    context.store.dispatch(LoginSuccessAction(context));
  }
}
