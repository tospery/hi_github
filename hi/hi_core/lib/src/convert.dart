import 'dart:convert';

class HiConvert {
  static String encodeToString(String data) => json.encode(data);
  static List<dynamic> decodeToList(String data) => json.decode(data);
  static Map<String, dynamic> decodeToMap(String data) =>
      json.decode(data);
}
