import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class HiPortalCell extends StatefulWidget {
  final HiPortal portal;
  final VoidCallback? onPressed;

  const HiPortalCell({super.key, required this.portal, this.onPressed});

  @override
  State<HiPortalCell> createState() => _HiPortalCellState();
}

class _HiPortalCellState extends State<HiPortalCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: hiBorder(
            bottom: widget.portal.separated,
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
            _buildHeadView(),
            _buildTailView(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadView() {
    return Row(
      children: [
        widget.portal.icon?.isNotEmpty ?? false
            ? widget.portal.icon!.image(width: 25)
            : Container(),
        widget.portal.icon?.isNotEmpty ?? false
            ? hiSpace(width: 10)
            : Container(),
        Text(
          widget.portal.title ?? '',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildTailView() {
    return Row(
      children: [
        widget.portal.detail?.isNotEmpty ?? false
            ? Container(
                constraints: BoxConstraints(
                  maxWidth: context.mediaQueryDataSize.width - 140,
                ),
                child: Text(
                  widget.portal.detail!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              )
            : Container(),
        widget.portal.indicated
            ? const Icon(
                Icons.navigate_next,
                color: Colors.grey,
                size: 24,
              )
            : Container(),
      ],
    );
  }
}
