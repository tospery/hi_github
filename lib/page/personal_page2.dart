import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/ex/build_context.dart';
import 'package:hi_github/widget/portal_widget.dart';
import 'package:hi_github/widget/user_info_widget.dart';
import '../widget/personal_header.dart';
import '../widget/user_dynamic_card.dart';

class PersonalPage2 extends StatefulWidget {
  const PersonalPage2({Key? key}) : super(key: key);

  @override
  State<PersonalPage2> createState() => PersonalPage2State();
}

class PersonalPage2State extends State<PersonalPage2> {
  final ScrollController _controller = ScrollController();
  List<HiPortal> portals = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<HiAPPState>(builder: (context, store) {
      return Scaffold(
        appBar: AppBar(elevation: 0.2, title: Text(context.string.personal)),
        body: RefreshIndicator(
          onRefresh: loadData,
          color: Colors.blue,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: contentChild,
          ),
        ),
      );
    });
  }

  Widget get contentChild => Container(
        color: Colors.grey[100],
        child: ListView(
          // padding: const EdgeInsets.only(top: 30),
          children: buildContentList(),
        ),
      );

  List<Widget> buildContentList() {
    return [
      PersonalHeader(onPressed: _doUser),
      hiSpace(height: 10),
      const UserDynamicCard(),
      hiSpace(height: 10),
      const UserInfoWidget(),
      hiSpace(height: 10),
      PortalWidget(portals: portals),
    ];
  }

  Future<void> loadData() async {
    String string =
        await context.assetBundle.loadString('res/jsons/portals.json');
    var json = string.jsonObject as List? ?? [];
    var items = json.map(
      (e) {
        return HiPortal.fromJson(e as Map<String, dynamic>? ?? {});
      },
    ).toList();
    setState(() {
      portals = items;
    });
    log('items?????????: ${items.length}');

    log('????????????');
    return Future.delayed(const Duration(seconds: 3), () {
      log('abcd1234');
    });
  }

  // Widget _buildHead() {
  //   return Container(
  //     color: Colors.green,
  //     width: 100,
  //     height: 100,
  //   );
  // }

  void _doUser() async {
    HiRouter.shared().push(context, HiRouterPath.profile);

    // https://avatars.githubusercontent.com/u/3716286?v=4
  }

  Widget? getImage(String string) {
    Widget? result;
    try {
      result = Image.asset(string);
    } catch (e) {
      result = hiImage(string);
    }
    return result;
  }
}
