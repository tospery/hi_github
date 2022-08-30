import '../../core/function.dart';
import '../portal/hi_portal.dart';

class HiNormalPortal extends HiPortal {
  final String? icon;
  final String? title;
  final String? detail;
  final bool indicated;
  final bool separated;
  final double spacer;

  const HiNormalPortal({
    super.id,
    super.height,
    super.color,
    this.icon,
    this.title,
    this.detail,
    this.indicated = true,
    this.separated = true,
    this.spacer = 0,
  });

  factory HiNormalPortal.fromJson(Map<String, dynamic> json) => HiNormalPortal(
        id: hiString(json['id']),
        height: json['height'] as double?,
        color: json['color'] as String?,
        icon: json['icon'] as String?,
        title: json['title'] as String?,
        detail: json['detail'] as String?,
        indicated: json['indicated'] as bool? ?? true,
        separated: json['separated'] as bool? ?? true,
        spacer: json['spacer'] as double? ?? 0,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'height': height,
        'color': color,
        'icon': icon,
        'title': title,
        'detail': detail,
        'indicated': indicated,
        'separated': separated,
        'spacer': spacer,
      };

  @override
  List<Object?> get props => [
        id,
        height,
        color,
        icon,
        title,
        detail,
        indicated,
        separated,
        spacer,
      ];
}
