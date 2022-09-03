import '../../../core/hi_core.dart';

typedef HiItemCallback<M extends HiModel> = void Function(M model,
    {dynamic result});

class HiItem<M extends HiModel> {
  final double? width;
  final double? height;
  final M? model;

  HiItem(this.width, this.height, this.model);
}
