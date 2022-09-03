import 'package:flutter/material.dart';
import 'package:hi_flutter/frame/src/item/hi_portal_item.dart';
import '../../../core/hi_core.dart';
import '../item/hi_item.dart';
import '../model/hi_portal.dart';
import 'hi_list_page.dart';

class HiModelListPage extends HiListPage {
  const HiModelListPage({super.key, required super.parameters});

  @override
  State<HiModelListPage> createState() => HiModelListPageState();
}

class HiModelListPageState extends HiListPageState<HiItem, HiModelListPage> {
  @override
  Future<List<HiItem<HiModel>>> requestList(int pageIndex) async {
    List<HiItem<HiModel>> items = [];
    if (path != null) {
      var content = await context.assetBundle.loadString(path!);
      var json = content.jsonObject as List? ?? [];
      var portals = json
          .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList();
      items.addAll(portals.map((e) => HiPortalItem(model: e)).toList());
    }
    return items;
  }
  // @override
  // Future<List<HiModel>> requestList(int pageIndex) async {
  // List<HiModel> models = [];
  // if (path != null) {
  //   var content = await context.assetBundle.loadString(path!);
  //   var json = content.jsonObject as List? ?? [];
  //   var portals = json
  //       .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
  //       .toList();
  //   models.addAll(portals);
  // }
  // return models;
  // }
}



// import 'package:flutter/material.dart';
// import 'package:hi_flutter/core/hi_core.dart';
// import 'package:hi_flutter/frame/hi_frame.dart';

// class HiModelsPage extends HiScrollPage {
//   const HiModelsPage({super.key, required super.parameters});

//   @override
//   State<HiModelsPage> createState() => HiModelsPageState();
// }

// class HiModelsPageState extends HiScrollPageState<HiModel, HiModelsPage> {
//   @override
//   Widget buildContent() {
//     return ListView.builder(
//       physics: const AlwaysScrollableScrollPhysics(),
//       padding: const EdgeInsets.only(top: 0),
//       itemCount: list.length,
//       controller: scrollController,
//       itemBuilder: (context, index) => buildCell(list[index]),
//     );
//   }

//   Widget buildCell(HiModel model) {
//     return GestureDetector(
//       child: Container(
//         height: 50,
//       ),
//       onTap: () => doPressed(model),
//     );
//   }

//   @override
//   Future<List<HiModel>> requestList(int pageIndex) async {
//     if (path?.isEmpty ?? true) {
//       return [];
//     }
//     var content = await context.assetBundle.loadString(path!);
//     var json = content.jsonObject as List? ?? [];
//     var items = json
//         .map((e) => HiModel.fromJson(e as Map<String, dynamic>? ?? {}))
//         .toList();
//     return items;
//   }

//   void doPressed(HiModel model) {
//     log('点击的cell: $model');
//   }
// }
