import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal.g.dart';

@JsonSerializable()
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

  factory Portal.fromJson(Map<String, dynamic> json) {
    return _$PortalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PortalToJson(this);

  AssetImage get assetImage => AssetImage(icon);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, icon, text, indicated];
}
