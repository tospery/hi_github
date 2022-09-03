import 'package:hi_flutter/frame/src/item/hi_portal_item.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/cell/user_info_cell.dart';
import 'package:hi_github/core/datatype.dart';
import 'package:hi_github/extension/build_context.dart';
import 'package:hi_github/item/user_chart_item.dart';
import 'package:hi_github/item/user_info_item.dart';
import '../model/user.dart';

class PersonalPage extends HiModelListPage {
  const PersonalPage({super.key, super.parameters = const {}});

  @override
  PersonalPageState createState() => PersonalPageState();
}

class PersonalPageState extends HiModelListPageState {
  @override
  void init() {
    super.init();
    path = parameters.stringForKey(HiParameter.path) ??
        'res/jsons/personal_portals.json';
  }

  @override
  void setup() {
    super.setup();
    setState(() {
      title =
          parameters.stringForKey(HiParameter.title) ?? context.string.personal;
    });
  }

  @override
  Future<List<HiItem<HiModel>>> requestList(int pageIndex) async {
    var items = await super.requestList(pageIndex);
    // ignore: use_build_context_synchronously
    var user = context.storeStateUser<User>();
    if (user?.isValid ?? false) {
      items.insertAll(0, _buildUserBriefItems());
      items.insert(0, HiPortalItem(model: const HiPortal(height: 10)));
      items.insert(0, UserChartItem());
      items.insert(0, HiPortalItem(model: const HiPortal(height: 10)));
      items.insert(0, UserInfoItem());
    } else {}
    return items;
  }

  Iterable<HiItem<HiModel>> _buildUserBriefItems() {
    var user = context.storeStateUser<User>();
    return [
      HiPortalItem(
        model: HiPortal(
          id: PortalType.blog.instanceName,
          icon: 'res/images/job.png',
          title: user?.company,
          indicated: false,
        ),
      ),
      HiPortalItem(
        model: HiPortal(
          id: PortalType.blog.instanceName,
          icon: 'res/images/location.png',
          title: user?.location,
          indicated: false,
        ),
      ),
      HiPortalItem(
        model: HiPortal(
          id: PortalType.blog.instanceName,
          icon: 'res/images/email.png',
          title: user?.email,
          indicated: false,
        ),
      ),
      HiPortalItem(
        model: HiPortal(
          id: PortalType.blog.instanceName,
          icon: 'res/images/blog.png',
          title: user?.blog,
          separated: false,
        ),
      ),
    ];
  }

  // @override
  // void doPressed(HiItem<HiModel> item, {result}) {}

  @override
  void doPressed(HiItem<HiModel> item, {result}) {
    if (item is UserInfoItem) {
      switch (result) {
        case UserInfoClick.user:
          HiRouter.shared().push(
            context,
            // hiUriString(host: HiHost.user, path: '123'),
            hiUriString(host: HiHost.user),
          );
          break;
        default:
          break;
      }
    }
    // if (item is HiPortalItem) {
    //   var id = item.model?.id ?? '';
    //   var type = PortalType.fromValue(id);
    //   switch (type) {
    //     case PortalType.userInfo:
    //       break;
    //     default:
    //       break;
    //   }
    // }
  }

  // @override
  // void callback(HiModel model, {result}) {
  //   log('看看是否登录: ${context.storeStateLogin}');
  //   // var user = context.storeState.user?.real;
  //   // if (user == null) {
  //   //   return;
  //   // }
  //   // var myUser = user.copyWith(username: 'abcd1234');
  //   // var action = UpdateUserAction(myUser);
  //   // context.store.dispatch(action);
  // }
}

// class PersonalPage extends HiPortalsPage {
//   const PersonalPage({super.key, super.parameters = const {}});

//   @override
//   PersonalPageState createState() => PersonalPageState();
// }

// class PersonalPageState extends HiPortalsPageState {
// @override
// void init() {
//   super.init();
//   path = parameters.stringForKey(HiParameter.path) ??
//       'res/jsons/personal_portals.json';
// }

// @override
// void setup() {
//   super.setup();
//   setState(() {
//     title =
//         parameters.stringForKey(HiParameter.title) ?? context.string.personal;
//   });
// }

//   // @override
//   // Widget buildCell(HiPortal model) {
//   //   return model.cell(
//   //     data: user?.realUser,
//   //     callback: xxdoPressed,
//   //   );
//   // }

//   @override
//   Future<List<HiPortal>> requestList(int pageIndex) async {
//     if (path?.isEmpty ?? true) {
//       return [];
//     }
//     var content = await context.assetBundle.loadString(path!);
//     var json = content.jsonObject as List? ?? [];
//     var items = json
//         .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
//         .toList();
//     if (user?.realUser?.isValid ?? false) {
//       items.insert(0, HiPortal(id: PortalType.userinfo.instanceName));
//     } else {
//       items.insert(0, HiPortal(id: PortalType.unlogined.instanceName));
//     }
//     return items;
//   }
// }

// class PersonalPage extends HiScrollPage {
//   const PersonalPage({super.key, super.parameters = const {}});

//   @override
//   State<PersonalPage> createState() => PersonalPageState();
// }

// class PersonalPageState extends HiScrollPageState<HiModel, PersonalPage> {
//   @override
//   void setup() {
//     super.setup();
//     setState(() {
//       title =
//           parameters.stringForKey(HiParameter.title) ?? context.string.personal;
//     });
//   }

//   @override
//   Widget buildContent() {
//     return ListView.builder(
//       physics: const AlwaysScrollableScrollPhysics(),
//       padding: const EdgeInsets.only(top: 0),
//       itemCount: list.length,
//       controller: scrollController,
//       itemBuilder: (context, index) {
//         var model = list[index];
//         // if (model is HiSpace) {
//         //   return HiSpaceCell(space: model);
//         // } else
//         if (model is HiPortal) {
//           return HiPortalCell(
//             portal: model,
//             onPressed: () => _doPressed(model),
//           );
//         } else {
//           var type = PortalType.fromValue(model.id ?? '');
//           switch (type) {
//             case PortalType.unlogined:
//               return UnloginedCell(
//                 onPressed: _doPressUnlogin,
//               );
//             default:
//               return Container();
//           }
//         }
//       },
//     );
//   }

//   @override
//   Future<List<HiModel>> requestList(int pageIndex) async {
//     var content =
//         await context.assetBundle.loadString('res/jsons/personal_portals.json');
//     var json = content.jsonObject as List? ?? [];
//     List<HiModel> items = [];
//     if (user?.realUser?.isValid ?? false) {
//     } else {
//       items.add(HiModel(id: PortalType.unlogined.stringValue));
//     }
//     // items.add(
//     //     HiSpace(color: context.themeData.scaffoldBackgroundColor.hexString));
//     items.addAll(json
//         .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
//         .toList());
//     return items;
//   }

//   _doPressed(HiPortal model) {
//     var type = PortalType.fromValue(model.id ?? '');
//     if (type == PortalType.feedback) {
//       return HiRouter.shared().push(context, HiRouterPath.test);
//     }
//     if (type.routerPath != null) {
//       HiRouter.shared().push(context, type.routerPath!);
//     }
//   }

//   _doPressUnlogin() {
//     log('_doPressUnlogin');
//     HiRouter.shared().present(context, HiRouterPath.login);
//   }
// }
