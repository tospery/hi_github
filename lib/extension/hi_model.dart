import 'package:hi_flutter/hi_flutter.dart';

extension HiModelEx on HiModel {
  // String? get uriString {
  //   if (this is HiPortal) {
  //     var type = PortalType.fromValue(id ?? '');
  //     switch (type) {
  //       case PortalType.unlogined:
  //         return hiUriString(host: HiHost.login, queries: {
  //           HiParameter.routerMode: HiRouterMode.present.instanceName,
  //         });
  //       case PortalType.about:
  //         return hiUriString(host: HiHost.test);
  //       default:
  //         break;
  //     }
  //   }
  //   return null;
  // }

  // Widget cell({
  //   dynamic data,
  //   HiModelCallback? callback,
  // }) {
  //   if (this is HiPortal) {
  //     var type = PortalType.fromValue(id ?? '');
  //     switch (type) {
  //       case PortalType.appinfo:
  //         return const AppinfoCell();
  //       case PortalType.unlogined:
  //         return UnloginedCell(
  //           onPressed: () => callback != null ? callback(this) : null,
  //         );
  //       case PortalType.userinfo:
  //         return UserinfoCell(user: data as User?);
  //       default:
  //         return HiPortalCell(
  //           portal: this as HiPortal,
  //           onPressed: () => callback != null ? callback(this) : null,
  //         );
  //     }
  //   }
  //   return Container(
  //     height: 50,
  //     color: Colors.red,
  //   );
  // }
}
