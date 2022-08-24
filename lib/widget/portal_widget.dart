import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/model/portal.dart';

class PortalWidget extends StatefulWidget {
  final List<Portal> portals;

  const PortalWidget({super.key, required this.portals});

  @override
  State<PortalWidget> createState() => _PortalWidgetState();
}

class _PortalWidgetState extends State<PortalWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.portals.map(
        (e) {
          return _buildPortalView(e);
        },
      ).toList(),
    );
  }

  Widget _buildPortalView(Portal portal, {bool isLast = false}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: hiBorder(
          bottom: !isLast,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        left: 15,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: portal.assetImage,
                width: 25,
              ),
              hiSpace(width: 10),
              Text(
                portal.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          portal.indicated
              ? const Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                  size: 25,
                )
              : Container(),
        ],
      ),
    );
  }
}
