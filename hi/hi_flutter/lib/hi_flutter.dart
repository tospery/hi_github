library hi_flutter;

// web
export 'package:webview_flutter/webview_flutter.dart';

// other
export 'core/hi_core.dart';
export 'cache/hi_cache.dart';
export 'net_x/hi_net_x.dart';
// export 'router_x/hi_router_x.dart';
export 'tabbar/hi_tabbar.dart';
export 'dialog/hi_dialog.dart';
export 'provider/hi_provider.dart';
export 'navigator/hi_navigator.dart';
export 'frame/hi_frame.dart';

import 'package:hi_flutter/cache/hi_cache.dart';
import 'package:hi_flutter/frame/hi_frame.dart';

class HiFlutter {
  static Future<void> initialize() async {
    await HiCache.preInit();
    await HiApp.preInit();
  }
}
