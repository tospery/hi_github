import 'package:hi_flutter/core/model.dart';

import '../core/function.dart';

class HiPortal extends HiModel {
  final String? icon;
  final String? title;
  final String? detail;
  final bool indicated;
  final bool hasBottomLine;
  final double bottomSpaceHeight;

  const HiPortal({
    super.id,
    this.icon,
    this.title,
    this.detail,
    this.indicated = true,
    this.hasBottomLine = true,
    this.bottomSpaceHeight = 0,
  });

  factory HiPortal.fromJson(Map<String, dynamic> json) => HiPortal(
        id: hiString(json['id']),
        icon: json['icon'] as String?,
        title: json['title'] as String?,
        detail: json['detail'] as String?,
        indicated: json['indicated'] as bool? ?? true,
        hasBottomLine: json['hasBottomLine'] as bool? ?? true,
        bottomSpaceHeight: json['bottomSpaceHeight'] as double? ?? 0,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'title': title,
        'detail': detail,
        'indicated': indicated,
        'hasBottomLine': hasBottomLine,
        'bottomSpaceHeight': bottomSpaceHeight,
      };

  @override
  List<Object?> get props =>
      [id, icon, title, detail, indicated, hasBottomLine, bottomSpaceHeight];
}
