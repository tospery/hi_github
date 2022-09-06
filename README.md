获取appicon
FutureBuild详解
重写tabbar
webview
url schemes
Iterable
重写login
hinet->path（重构）
Future<bool>用于HiCache的返回值
添加item
看看cell数据的响应式
urlPattern是否需要登录
urlPattern自动跳登录页
HiRouter.shared().push(context, UriHiCoreEx.uri(host: HiHost.profile).toString());
只传id, 同时传model，自动跳登录页，检测登录
建议：是否检测登录，由传参决定，不通过提前埋下
portalcell的title最大长度
map通过扩展修改自身
    HiRouter.shared().configure();
    HiBaseResponse.dataKeys += ['access_token'];
    HiNet.shared().loginFunc = customLogin;
    HiNet.shared().userinfoFunc = customUserinfo;
作为ready的参数
收藏页，没有网络/加载失败/列表为空等异常页面，加载中页面
优化下拉刷新/加载更多的视觉效果
loadData的流数据实现方式
https://github.com/xuelongqy/flutter_easy_refresh
[](https://github.com/2d-inc/Flare-Flutter
https://pub.dev/packages/extended_nested_scroll_view
https://github.com/dart-lang/convert
https://pub.dev/packages/carousel_slider
https://pub.dev/packages/rive
https://pub.dev/packages/qr_flutter
https://pub.dev/packages/flutter_sticky_header)