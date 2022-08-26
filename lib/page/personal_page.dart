import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import 'package:hi_github/widget/portal_widget.dart';
import 'package:hi_github/widget/user_info_widget.dart';
import '../redux/app_state.dart';
import '../widget/personal_header.dart';
import '../widget/user_dynamic_card.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
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
    return StoreBuilder<APPState>(builder: (context, store) {
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
    log('items的大小: ${items.length}');

    log('刷新开始');
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
