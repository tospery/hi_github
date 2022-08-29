import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/core/datatype.dart';
import 'package:hi_github/ex/hi_user.dart';
import 'package:hi_github/widget/unlogined_cell.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => PersonalPageState();
}

class PersonalPageState extends HiScrollState<HiModel, PersonalPage> {
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
        // } else {
        //   return HiPortalCell(
        //     portal: model as HiPortal,
        //     onPressed: () => _doPressed(model),
        //   );
        // }
        if (model is HiSpace) {
          return HiSpaceCell(space: model);
        } else if (model is HiPortal) {
          return HiPortalCell(
            portal: model,
            onPressed: () => _doPressed(model),
          );
        } else {
          var type = PortalType.fromValue(model.id ?? '');
          switch (type) {
            case PortalType.unlogined:
              return UnloginedCell(onPressed: _doPressUnlogin,);
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
      items.add(HiModel(id: PortalType.unlogined.value));
    }
    items.add(HiSpace(color: context.themeData.scaffoldBackgroundColor.hexString));
    items.addAll(json
        .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList());
    return items;
  }

  _doPressed(HiPortal model) {
    var type = PortalType.fromValue(model.id ?? '');
    HiRouter.shared().push(context, type.path);
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
  // Widget buildBodyView() {
  //   return Container(
  //     color: Colors.red,
  //   );
  // }
}
