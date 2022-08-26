import 'package:flutter/material.dart';
import 'package:hi_flutter/core/context.dart';
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
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: hiBorder(
              bottom: portal.separator,
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeadView(portal),
              _buildTailView(portal),
            ],
          ),
        ),
        _buildSpaceView(portal),
      ],
    );
    // return Container(
    //   height: 50,
    // decoration: BoxDecoration(
    //   border: hiBorder(
    //     bottom: portal.separator,
    //   ),
    //   color: Colors.white,
    // ),
    // padding: const EdgeInsets.only(
    //   left: 15,
    //   right: 10,
    // ),
    //   child: Column(
    //     children: [
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     _buildHeadView(portal),
    //     _buildTailView(portal),
    //     _buildSpaceView(portal),
    //   ],
    // ),
    //     ],
    //   ),
    // );
  }

  Widget _buildHeadView(Portal portal) {
    return Row(
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
    );
  }

  Widget _buildTailView(Portal portal) {
    return Row(
      children: [
        portal.detail.isNotEmpty
            ? Container(
                constraints: BoxConstraints(
                  maxWidth: context.mediaQueryDataSize.width - 140,
                ),
                child: Text(
                  portal.detail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
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
    );
  }

  Widget _buildSpaceView(Portal portal) {
    return portal.spacer > 0
        ? Container(
            height: portal.spacer,
          )
        : Container();
  }
}
