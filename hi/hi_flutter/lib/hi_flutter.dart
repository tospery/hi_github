library hi_flutter;

// web
export 'package:webview_flutter/webview_flutter.dart';
export 'package:path_provider/path_provider.dart';

// other
export 'core/hi_core.dart';
export 'cache/hi_cache.dart';
export 'net/hi_net.dart';
export 'tabbar/hi_tabbar.dart';
export 'dialog/hi_dialog.dart';
export 'router/hi_router.dart';
export 'frame/hi_frame.dart';

import 'package:hi_flutter/cache/hi_cache.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'package:hi_flutter/frame/hi_frame.dart';
import 'package:hi_flutter/net/hi_net.dart';
import 'package:hi_flutter/router/hi_router.dart';
import 'package:path_provider/path_provider.dart';

class HiFlutter {
  static bool hasInited = false;

  static Future<bool> ready({
    HiGetUseridFunc? getUseridFunc,
    HiNetConfiguration? netConfiguration,
    HiRouterConfiguration? routerConfiguration,
  }) async {
    if (hasInited) {
      return true;
    }
    hasInited = true;
    hiGetUseridFunc = getUseridFunc;
    await HiNet.shared().ready(netConfiguration);
    await HiRouter.shared().ready(routerConfiguration);
    await HiCache.ready();
    await HiPackageManager.ready();
    var path = await getApplicationDocumentsDirectory();
    log('path = $path', tag: HiLogTag.flutter);
    return true;
  }
}
