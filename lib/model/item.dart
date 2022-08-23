class Item {
  int id;
  String icon;
  String text;
  bool indicated;

  Item({
    this.id = 0,
    this.icon = '',
    this.text = '',
    this.indicated = true,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
}
