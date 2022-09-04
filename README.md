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
HiRouter.shared().push(context, hiUriString(host: HiHost.profile));
只传id, 同时传model，自动跳登录页，检测登录
建议：是否检测登录，由传参决定，不通过提前埋下
portalcell的title最大长度
map通过扩展修改自身
    HiRouter.shared().configure();
    HiBaseResponse.dataKeys += ['access_token'];
    HiNet.shared().loginFunc = customLogin;
    HiNet.shared().userinfoFunc = customUserinfo;
作为ready的参数