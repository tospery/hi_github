import 'package:flutter/material.dart';
import '../core/widget.dart';
import 'function.dart';
import 'string.dart';
import 'portal.dart';

class HiPortalListView extends StatefulWidget {
  final List<Portal> portals;

  const HiPortalListView({super.key, required this.portals});

  @override
  State<HiPortalListView> createState() => _HiPortalListViewState();
}

class _HiPortalListViewState extends State<HiPortalListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.portals.map((e) => _buildPortalItem(e)).toList(),
    );
  }

  Widget _buildPortalItem(Portal portal) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: hiBorder(
          bottom: portal.separator,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        left: 15,
        right: 10,
      ),
      child: _chooseStyle(portal),
    );
  }

  Widget _chooseStyle(Portal portal) {
    return _style2(portal);
  }

  // Widget _style1(Portal portal) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Row(
  //         children: [
  //           portal.icon != null ? portal.icon!.image(width: 25) : Container(),
  //           hiSpace(width: 10),
  //           Text(
  //             portal.title,
  //             style: const TextStyle(
  //               fontSize: 16,
  //               color: Colors.black,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //         ],
  //       ),
  //       portal.indicator
  //           ? const Icon(
  //               Icons.navigate_next,
  //               color: Colors.grey,
  //               size: 25,
  //             )
  //           : Container(),
  //     ],
  //   );
  // }

  Widget _style2(Portal portal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            portal.icon.isNotEmpty ? portal.icon.image(width: 25) : Container(),
            portal.icon.isNotEmpty ? hiSpace(width: 10) : Container(),
            Text(
              portal.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          children: [
            portal.detail.isNotEmpty
                ? Text(
                    portal.detail,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  )
                : Container(),
            portal.indicator
                ? const Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                    size: 25,
                  )
                : Container(),
          ],
        )
      ],
    );
  }
}
