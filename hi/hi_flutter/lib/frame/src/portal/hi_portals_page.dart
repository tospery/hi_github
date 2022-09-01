import 'package:flutter/material.dart';
import 'package:hi_flutter/core/hi_core.dart';
import 'package:hi_flutter/frame/hi_frame.dart';

class HiPortalsPage extends HiScrollPage {
  const HiPortalsPage({super.key, required super.parameters});

  @override
  State<HiPortalsPage> createState() => HiPortalsPageState();
}

class HiPortalsPageState extends HiScrollPageState<HiPortal, HiPortalsPage> {
  @override
  Widget buildContent() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: list.length,
      controller: scrollController,
      itemBuilder: (context, index) => buildCard(list[index]),
    );
  }

  Widget buildCard(HiPortal model) {
    return GestureDetector(
      child: Container(
        height: 50,
      ),
      onTap: () => doPressed(model),
    );
  }

  @override
  Future<List<HiPortal>> requestList(int pageIndex) async {
    if (path?.isEmpty ?? true) {
      return [];
    }
    var content = await context.assetBundle.loadString(path!);
    var json = content.jsonObject as List? ?? [];
    var items = json
        .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList();
    return items;
  }

  void doPressed(HiPortal model) {
    log('点击的cell: $model');
  }
}
