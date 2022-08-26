import 'package:equatable/equatable.dart';

// portal_style
// normal_item
// normal_cell
// normal_list_view
// normal_list_page

class Portal extends Equatable {
  final int id;
  final String icon;
  final String title;
  final String detail;
  final bool indicator;
  final bool separator;
  final double spacer;

  const Portal({
    this.id = 0,
    this.icon = '',
    this.title = '',
    this.detail = '',
    this.indicator = true,
    this.separator = true,
    this.spacer = 0,
  });

  factory Portal.fromJson(Map<String, dynamic> json) {
    return _$PortalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PortalToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, icon, title, indicator, separator, spacer];
}

Portal _$PortalFromJson(Map<String, dynamic> json) => Portal(
      id: json['id'] as int? ?? 0,
      icon: json['icon'] as String? ?? '',
      title: json['title'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
      indicator: json['indicator'] as bool? ?? true,
      separator: json['separator'] as bool? ?? true,
      spacer: json['spacer'] as double? ?? 0,
    );

Map<String, dynamic> _$PortalToJson(Portal instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'title': instance.title,
      'detail': instance.detail,
      'indicator': instance.indicator,
      'separator': instance.separator,
      'spacer': instance.spacer,
    };
