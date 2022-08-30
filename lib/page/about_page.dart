import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class AboutPage extends HiScrollPage {
  const AboutPage({
    super.key,
    super.parameters = const {},
    super.canRefresh = false,
    super.canLoadMore = false,
  });

  // const AboutPage({Key? key, super.parameters = const {}}) : super(key: key);

  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends HiScrollState<HiPortal, AboutPage> {
  @override
  Widget buildChildView() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: list.length,
      controller: scrollController,
      itemBuilder: (context, index) => HiPortalCard(portal: list[index]),
    );
  }

  @override
  Future<List<HiPortal>> requestList(int pageIndex) async {
    var content =
        await context.assetBundle.loadString('res/jsons/about_portals.json');
    var json = content.jsonObject as List? ?? [];
    var items = json
        .map((e) => HiPortal.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList();
    return items;
  }
}
