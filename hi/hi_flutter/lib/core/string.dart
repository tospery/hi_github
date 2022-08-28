import 'dart:convert';

extension HiCoreString on String {
  dynamic get jsonObject =>
      isNotEmpty ? json.decode(this) : <String, dynamic>{};
}
