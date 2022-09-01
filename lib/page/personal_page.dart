import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import '../core/datatype.dart';
import '../extension/hi_user.dart';
import '../widget/cell/unlogined_card.dart';

class PersonalPage extends HiScrollPage {
  const PersonalPage({super.key, super.parameters = const {}});

  @override
  State<PersonalPage> createState() => PersonalPageState();
}

class PersonalPageState extends HiScrollPageState<HiModel, PersonalPage> {
  @override
  void setup() {
    super.setup();
    setState(() {
      title =
          parameters.stringForKey(HiParameter.title) ?? context.string.personal;
    });
  }

  @override
  Widget buildChildView() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: list.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        var model = list[index];
        // if (model is HiSpace) {
        //   return HiSpaceCell(space: model);
        // } else
        if (model is HiPortal) {
          return HiPortalCard(
            portal: model,
            onPressed: () => _doPressed(model),
          );
        } else {
          var type = PortalType.fromValue(model.id ?? '');
          switch (type) {
            case PortalType.unlogined:
              return UnloginedCard(
                onPressed: _doPressUnlogin,
              );
            default:
              return Container();
          }
        }
      },
    );
  }

  @override
  Future<List<HiModel>> requestList(int pageIndex) async {
    var content =
        await context.assetBundle.loadString('res/jsons/personal_portals.json');
    var json = content.jsonObject as List? ?? [];
    List<HiModel> items = [];
    if (user?.realUser?.isValid ?? false) {
    } else {
      items.add(HiModel(id: PortalType.unlogined.stringValue));
    }
    // items.add(
    //     HiSpace(color: context.themeData.scaffoldBackgroundColor.hexString));
    items.addAll(json
        .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList());
    return items;
  }

  _doPressed(HiPortal model) {
    var type = PortalType.fromValue(model.id ?? '');
    if (type == PortalType.feedback) {
      return HiRouter.shared().push(context, HiRouterPath.test);
    }
    if (type.routerPath != null) {
      HiRouter.shared().push(context, type.routerPath!);
    }
  }

  _doPressUnlogin() {
    log('_doPressUnlogin');
    HiRouter.shared().present(context, HiRouterPath.login);
  }

// class PersonalPageState extends HiBaseState<PersonalPage> {
  // @override
  // PreferredSizeWidget? buildAppBar() {
  //   return AppBar(
  //     title: Text(context.string.personal),
  //   );
  // }

  // @override
  // Widget buildBody() {
  //   return Container(
  //     color: Colors.red,
  //   );
  // }
}
