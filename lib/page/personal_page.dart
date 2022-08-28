import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/core/datatype.dart';

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
        if (model is HiSpace) {
          return HiSpaceCell(space: model);
        } else {
          return HiPortalCell(
            portal: model as HiPortal,
            onPressed: () => _doPressed(model),
          );
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
    items.add(HiSpace(color: Colors.red.hexString));
    items.addAll(json
        .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList());
    return items;
  }

  _doPressed(HiPortal model) {
    var value = int.parse(model.id ?? '1');
    var type = PersonalPortalType.fromValue(value);
    HiRouter.shared().push(context, type.path);
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
