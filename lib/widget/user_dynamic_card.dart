import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import '../extension/hi_user.dart';

class UserDynamicCard extends StatefulWidget {
  const UserDynamicCard({Key? key}) : super(key: key);

  @override
  State<UserDynamicCard> createState() => _UserDynamicCardState();
}

class _UserDynamicCardState extends State<UserDynamicCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 120,
          child: SvgPicture.network(
            context.store.state.user?.realUser?.dynamicCardUrlString ?? '',
            allowDrawingOutsideViewBox: true,
            placeholderBuilder: (BuildContext context) => SizedBox(
              width: context.mediaQueryData.size.width,
              height: 120,
              child: const Center(
                child: SpinKitRipple(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
