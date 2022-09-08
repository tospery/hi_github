import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../item/repository_item.dart';

class RepositoryCell extends HiCell<RepositoryItem> {
  const RepositoryCell({super.key, required super.item, super.onPressed});

  @override
  RepositoryCellState createState() => RepositoryCellState();
}

class RepositoryCellState extends HiCellState<RepositoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed != null ? widget.onPressed!(item) : null,
      child: Container(
        color: context.themeData.colorScheme.primary,
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: Column(
          children: [
            _buildTop(context),
            _buildDesc(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'res/images/repository.png',
            height: 30,
            color: context.themeData.colorScheme.onPrimary,
          ),
          hiSpace(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(context),
              hiSpace(height: 2),
              _buildSubtitle(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: ColorsHiCoreEx.randomColor,
            width: 10,
            height: 10,
          ),
        ),
        hiSpace(width: 4),
        Text(
          item.model?.language ?? '',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  _buildTitle(BuildContext context) {
    return SizedBox(
      width: context.mediaQueryData.size.width - 15 - 32 - 8 - 20,
      child: Text(
        item.model?.fullName ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.themeData.primaryTextTheme.displaySmall,
      ),
    );
  }

  _buildDesc(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        item.model?.description ?? '',
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: context.themeData.textTheme.displaySmall,
      ),
    );
  }
}
