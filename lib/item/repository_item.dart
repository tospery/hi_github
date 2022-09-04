import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../model/repository.dart';

class RepositoryItem extends HiItem<Repository> {
  RepositoryItem({super.width, super.height, super.model});

  @override
  Widget cell(HiCellPressed<RepositoryItem>? onPressed) {
    // return UserinfoCell(item: this, onPressed: onPressed);
    return Container(
      height: 50,
      color: ColorsHiCoreEx.randomColor,
    );
  }
}
