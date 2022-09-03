import 'package:flutter/material.dart';
import 'package:hi_flutter/frame/src/extension/string.dart';
import '../core.dart';
import '../item/hi_portal_item.dart';
import '../../../core/hi_core.dart';
import 'hi_cell.dart';

class HiPortalCell extends HiCell<HiPortalItem> {
  const HiPortalCell({super.key, required super.item});

  @override
  HiPortalCellState createState() => HiPortalCellState();
}

class HiPortalCellState extends HiCellState<HiPortalItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.model?.isSpace ?? false || widget.onPressed == null) {
          return;
        }
        widget.onPressed!(item);
      },
      child: Card(
        color: item.model?.isSpace ?? false
            ? Colors.transparent
            : item.model?.color?.toColor(),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 10),
          decoration: BoxDecoration(
            border: hiBorder(context: context, bottom: true),
          ),
          height: item.model?.height,
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
    return item.model?.icon?.isNotEmpty ?? false
        ? item.model!.icon!.toImage(width: 25)
        : Container();
  }

  _buildHeadSpace() {
    return item.model?.icon?.isNotEmpty ?? false
        ? hiSpace(width: 10)
        : Container();
  }

  _buildHeadText() {
    return (item.model?.title?.isNotEmpty ?? false)
        ? Container(
            constraints: BoxConstraints(
              maxWidth: context.mediaQueryDataSize.width / 2,
            ),
            child: Text(
              item.model!.title!,
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
    return item.model?.detail?.isNotEmpty ?? false
        ? Container(
            constraints: BoxConstraints(
              maxWidth: context.mediaQueryDataSize.width - 140,
            ),
            child: Text(
              item.model!.detail!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.themeData.textTheme.bodyMedium,
            ),
          )
        : Container();
  }

  _buildTailIndicator() {
    if (item.model?.isSpace ?? false) {
      return Container();
    }
    return item.model!.indicated
        ? hiIndicator(
            context: context,
            icon: Icons.navigate_next,
          )
        : Container();
  }
}
