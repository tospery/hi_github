import 'dart:convert' as convert;
import '../../../core/hi_core.dart';

class HiBaseResponse {
  final int code;
  final String message;
  final dynamic data;
  final dynamic json;
  // final HiBaseRequest request;
  // final dynamic httpResponse;
  // final json

  static List<String> codeKeys = ['code'];
  static List<String> messageKeys = ['message'];
  static List<String> dataKeys = ['data'];

  HiBaseResponse({this.code = 200, this.message = 'OK', this.data, this.json});

  @override
  String toString() {
    var myData = data?.toString() ?? '';
    if (data is Map) {
      myData = convert.json.encode(data);
    }
    var myRaw = json?.toString() ?? '';
    if (json is Map) {
      myRaw = convert.json.encode(json);
    }
    return 'HiBaseResponse(code: $code, message: $message, data: $myData, json: $myRaw)';
  }

  factory HiBaseResponse.fromJson(Map<String, dynamic> json) {
    int code = json.valueForKeys(codeKeys) ?? 200;
    if (code == 0) {
      code = 200;
    }
    String message = json.valueForKeys(messageKeys) ?? 'OK';
    dynamic data = json.valueForKeys(dataKeys);
    return HiBaseResponse(code: code, message: message, data: data, json: json);
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data,
    };
  }
}
