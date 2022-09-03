import '../../../core/hi_core.dart';

class HiPortal extends HiModel {
  final String? icon;
  final String? title;
  final String? detail;
  final double height;
  final String? color;
  final bool indicated;
  final bool separated;

  static const String spaceId = 'space';

  const HiPortal({
    super.id,
    this.icon,
    this.title,
    this.detail,
    this.color,
    this.height = 50,
    this.indicated = true,
    this.separated = true,
  });

  bool get isSpace => (id?.isEmpty ?? true) || (id == 'space');

  factory HiPortal.fromJson(Map<String, dynamic> json) => HiPortal(
        id: hiString(json['id']),
        icon: json['icon'] as String?,
        title: json['title'] as String?,
        detail: json['detail'] as String?,
        color: json['color'] as String?,
        height: hiDouble(json['height']) ?? 50,
        indicated: json['indicated'] as bool? ?? true,
        separated: json['separated'] as bool? ?? true,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'title': title,
        'detail': detail,
        'color': color,
        'height': height,
        'indicated': indicated,
        'separated': separated,
      };

  @override
  List<Object?> get props => [
        id,
        icon,
        title,
        detail,
        color,
        height,
        indicated,
        separated,
      ];
}
