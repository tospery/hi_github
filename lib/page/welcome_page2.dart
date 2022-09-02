import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../model/user.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({Key? key}) : super(key: key);

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
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
    var token = HiCache.shared().get<String>(HiKey.token);
    var user = User.fromJson(
        (HiCache.shared().get<String>(HiKey.user) ?? '').jsonObject);
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
