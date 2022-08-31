import 'package:flutter/material.dart';
import '../../../core/hi_core.dart';
import '../scroll/hi_scroll_page.dart';
import 'hi_portal.dart';
import 'hi_portal_card.dart';

class HiPortalPage extends HiScrollPage {
  const HiPortalPage({
    super.key,
    required super.parameters,
    super.canRefresh = false,
    super.canLoadMore = false,
  });

  @override
  State<HiPortalPage> createState() => HiPortalPageState();
}

class HiPortalPageState extends HiScrollPageState<HiPortal, HiPortalPage> {
  late final String? path;

  @override
  void initState() {
    path = widget.parameters.stringForKey(HiParameter.path);
    log('看看portal json的path: $path, paramters = ${widget.parameters}');
    super.initState();
  }

  @override
  Widget buildChildView() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: list.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        var portal = list[index];
        return HiPortalCard(
          portal: portal,
          onPressed: () => doPressed(portal),
          // onPressed: () =>
          //     widget.onPressed != null ? widget.onPressed!(portal) : null,
        );
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
}
