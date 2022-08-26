import 'package:hi_flutter/hi_flutter.dart';

class Portal extends Equatable {
  final int id;
  final String icon;
  final String text;
  final bool indicated;

  const Portal({
    this.id = 0,
    this.icon = '',
    this.text = '',
    this.indicated = true,
  });

  factory Portal.fromJson(Map<String, dynamic> json) => Portal(
        id: json['id'] as int? ?? 0,
        icon: json['icon'] as String? ?? '',
        text: json['text'] as String? ?? '',
        indicated: json['indicated'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'text': text,
        'indicated': indicated,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, icon, text, indicated];
}
