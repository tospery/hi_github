import 'package:hi_flutter/hi_flutter.dart';

import '../model/user.dart';

class WelcomePage extends HiWelcomePage {
  const WelcomePage({super.key, required super.parameters});

  @override
  // ignore: library_private_types_in_public_api
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends HiRootPageState {
  @override
  Future<void> loadData({loadMore = false}) async {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        var login = HiCache.shared().get<bool>(HiKey.login) ?? false;
        if (!login) {
          context.store.dispatch(DidLogoutAction(context, true));
          return;
        }
        var string = HiCache.shared().get<String>(HiKey.user) ?? '';
        var json = string.toJson() as Map<String, dynamic>? ?? {};
        var user = User.fromJson(json);
        context.store.dispatch(UpdateUserAction(user));
        context.store.dispatch(DidLoginAction(context, true));
      },
    );
  }
}
