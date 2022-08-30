import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class AboutPage extends HiPage {
  const AboutPage({Key? key, super.parameters = const {}}) : super(key: key);

  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends HiScrollState<HiModel, AboutPage> {
  @override
  Widget buildChildView() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: list.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        // var model = list[index];
        return Container(
          color: hiRandomColor,
          height: 50,
        );
      },
    );
  }

  @override
  Future<List<HiModel>> requestList(int pageIndex) {
    throw UnimplementedError();
  }
}
