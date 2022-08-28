import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../model/user.dart';

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
    Future.delayed(const Duration(milliseconds: 200), () {
      initStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  void initStore() {
    var token = HiCache.shared().get<String>(HiCacheKey.token);
    var user = User.fromJson(
        (HiCache.shared().get<String>(HiCacheKey.user) ?? '').jsonObject);
    log('获取到的user: $user');
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
