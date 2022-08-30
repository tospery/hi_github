import '../../../core/function.dart';
import '../../../core/model.dart';

class HiPortal extends HiModel {
  final double? height;
  final String? color;

  const HiPortal({super.id, this.height, this.color});

  factory HiPortal.fromJson(Map<String, dynamic> json) => HiPortal(
        id: hiString(json['id']),
        height: json['height'] as double?,
        color: json['color'] as String?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'height': height,
        'color': color,
      };

  @override
  List<Object?> get props => [
        id,
        height,
        color,
      ];
}
