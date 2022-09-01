import 'package:flutter/material.dart';
import '../../../core/hi_core.dart';
import '../scroll/hi_scroll_page.dart';
import 'hi_portal.dart';
import 'hi_portal_cell.dart';

class HiPortalPage extends HiScrollPage {
  const HiPortalPage({
    super.key,
    required super.parameters,
  });

  @override
  State<HiPortalPage> createState() => HiPortalPageState();
}

class HiPortalPageState extends HiScrollPageState<HiPortal, HiPortalPage> {
  @override
  Widget buildContent() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: list.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        var portal = list[index];
        return buildCard(portal);
      },
    );
  }

  @override
  Future<List<HiPortal>> requestList(int pageIndex) async {
    if (path == null) {
      return [];
    }
    var content = await context.assetBundle.loadString(path!);
    var json = content.jsonObject as List? ?? [];
    var items = json
        .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList();
    return items;
  }

  void doPressed(HiPortal portal) {
    log('点击的card: $portal');
  }

  Widget buildCard(HiPortal portal) {
    return HiPortalCell(
      portal: portal,
      onPressed: () => doPressed(portal),
    );
  }
}
