import 'package:flutter/material.dart';
import 'package:hi_flutter/frame/hi_frame.dart';
import '../../../core/hi_core.dart';

class HiPortalCell2 extends StatefulWidget {
  final HiPortal portal;
  final VoidCallback? onPressed;

  const HiPortalCell2({super.key, required this.portal, this.onPressed});

  @override
  State<HiPortalCell2> createState() => _HiPortalCell2State();
}

class _HiPortalCell2State extends State<HiPortalCell2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.portal.isSpace ? null : widget.onPressed,
      child: Card(
        color: widget.portal.isSpace
            ? Colors.transparent
            : widget.portal.color?.toColor(),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 10),
          decoration: BoxDecoration(
            border: hiBorder(context: context, bottom: true),
          ),
          height: widget.portal.height,
          child: _buildContentView(),
        ),
      ),
    );
  }

  _buildContentView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeadView(),
        _buildTailView(),
      ],
    );
  }

  _buildHeadView() {
    return Row(
      children: [
        _buildHeadIcon(),
        _buildHeadSpace(),
        _buildHeadText(),
      ],
    );
  }

  _buildHeadIcon() {
    return widget.portal.icon?.isNotEmpty ?? false
        ? widget.portal.icon!.toImage(width: 25)
        : Container();
  }

  _buildHeadSpace() {
    return widget.portal.icon?.isNotEmpty ?? false
        ? hiSpace(width: 10)
        : Container();
  }

  _buildHeadText() {
    return (widget.portal.title?.isNotEmpty ?? false)
        ? Container(
            constraints: BoxConstraints(
              maxWidth: context.mediaQueryDataSize.width / 2,
            ),
            child: Text(
              widget.portal.title!,
              style: context.themeData.textTheme.titleMedium,
            ),
          )
        : Container();
  }

  _buildTailView() {
    return Row(
      children: [
        _buildTailDetail(),
        _buildTailIndicator(),
      ],
    );
  }

  _buildTailDetail() {
    return widget.portal.detail?.isNotEmpty ?? false
        ? Container(
            constraints: BoxConstraints(
              maxWidth: context.mediaQueryDataSize.width - 140,
            ),
            child: Text(
              widget.portal.detail!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.themeData.textTheme.bodyMedium,
            ),
          )
        : Container();
  }

  _buildTailIndicator() {
    if (widget.portal.isSpace) {
      return Container();
    }
    return widget.portal.indicated ?? false
        ? hiIndicator(
            context: context,
            icon: Icons.navigate_next,
          )
        : Container();
  }
}
