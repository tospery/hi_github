import 'package:hi_flutter/hi_flutter.dart';

import '../model/user.dart';

class RootPage extends HiRootPage {
  const RootPage({super.key, required super.parameters});

  @override
  // ignore: library_private_types_in_public_api
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends HiRootPageState {
  @override
  Future<void> loadData({loadMore = false}) async {
    Future.delayed(const Duration(milliseconds: 200), () {
      var user = User.fromJson(
          (HiCache.shared().get<String>(HiCacheKey.user) ?? '').jsonObject);
      log('获取到的user: $user');
      if (!user.isValid) {
        context.store.dispatch(LogoutSuccessAction(context, false));
        return;
      }
      context.store.dispatch(UpdateUserAction(user));
      context.store.dispatch(LoginSuccessAction(context));
    });
  }
}
