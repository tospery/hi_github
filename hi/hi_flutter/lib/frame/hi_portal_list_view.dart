import 'package:flutter/material.dart';
import '../../core/context.dart';
import '../../core/widget.dart';
import 'function.dart';
import 'string.dart';
import 'hi_normal_portal.dart';

class HiPortalListView extends StatefulWidget {
  final List<HiNormalPortal> portals;

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

  Widget _buildPortalItem(HiNormalPortal portal) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: hiBorder(
              bottom: portal.separated,
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
  }

  Widget _buildHeadView(HiNormalPortal portal) {
    return Row(
      children: [
        portal.icon?.isNotEmpty ?? false
            ? portal.icon!.image(width: 25)
            : Container(),
        portal.icon?.isNotEmpty ?? false ? hiSpace(width: 10) : Container(),
        Text(
          portal.title ?? '',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildTailView(HiNormalPortal portal) {
    return Row(
      children: [
        portal.detail?.isNotEmpty ?? false
            ? Container(
                constraints: BoxConstraints(
                  maxWidth: context.mediaQueryDataSize.width - 140,
                ),
                child: Text(
                  portal.detail!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              )
            : Container(),
        portal.indicated
            ? const Icon(
                Icons.navigate_next,
                color: Colors.grey,
                size: 24,
              )
            : Container(),
      ],
    );
  }

  Widget _buildSpaceView(HiNormalPortal portal) {
    return portal.spacer > 0
        ? Container(
            height: portal.spacer,
          )
        : Container();
  }
}
