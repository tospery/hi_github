import 'package:hi_flutter/core/function.dart';

import 'model.dart';

class HiUser extends HiModel {
  final String? username;
  final String? password;
  final String? phone;
  final String? token;

  const HiUser({
    super.id,
    this.username,
    this.password,
    this.phone,
    this.token,
  });

  @override
  bool get isValid =>
      (id?.isNotEmpty ?? false) && (username?.isNotEmpty ?? false);

  factory HiUser.fromJson(Map<String, dynamic> json) => HiUser(
        id: hiString(json['id']),
        username: json['username'] as String?,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        token: json['token'] as String?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'phone': phone,
        'token': token,
      };
}
