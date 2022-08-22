import 'dart:convert';

extension HiCoreString on String {
  Map<String, dynamic> get jsonObject => json.decode(this);
}
