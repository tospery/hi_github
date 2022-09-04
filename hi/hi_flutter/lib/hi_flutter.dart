library hi_flutter;

// web
export 'package:webview_flutter/webview_flutter.dart';

// other
export 'core/hi_core.dart';
export 'cache/hi_cache.dart';
export 'net/hi_net.dart';
export 'tabbar/hi_tabbar.dart';
export 'dialog/hi_dialog.dart';
export 'router/hi_router.dart';
export 'frame/hi_frame.dart';

import 'package:hi_flutter/cache/hi_cache.dart';
import 'package:hi_flutter/frame/hi_frame.dart';
import 'package:hi_flutter/router/hi_router.dart';

class HiFlutter {
  static Future<bool> ready({
    HiRouterAddDefaultUriQueriesFunc? customUriFunc,
  }) async {
    await HiCache.ready();
    await HiPackageManager.ready();
    HiRouter.shared().customUriFunc = customUriFunc;
    return true;
  }
}
