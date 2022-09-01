import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/core/datatype.dart';
import 'package:hi_github/extension/build_context.dart';
import 'package:hi_github/extension/hi_model.dart';

class PersonalPage extends HiPortalsPage {
  const PersonalPage({super.key, super.parameters = const {}});

  @override
  PersonalPageState createState() => PersonalPageState();
}

class PersonalPageState extends HiPortalsPageState {
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
  Widget buildCell(HiPortal model) {
    return model.cell(() => doPressed(model));
  }

  @override
  void doPressed(HiPortal model) {
    // log('点击了cell: ${PortalType.unlogined.instanceName}');
    // var path = model.navigationPath;
    // if (path?.isEmpty ?? true) {
    //   return;
    // }
    // navigator.forward(context, path!);
    // var a1 = true;
    // var a2 = 1;
    // var a3 = 1.2;
    // var a4 = 'string';
    // if (a4 is Object) {

    // }
  }
}

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
