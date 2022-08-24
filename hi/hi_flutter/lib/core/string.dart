import 'dart:convert';

extension HiCoreString on String {
  dynamic get jsonObject => json.decode(this);
}
