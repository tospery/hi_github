import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'datatype.dart';
import 'function.dart';

class HiModel extends Equatable {
  final String? id;

  bool get isValid => id?.isNotEmpty ?? false;
  String? get targetUriString => null;

  const HiModel({this.id});

  factory HiModel.fromJson(Map<String, dynamic> json) => HiModel(
        id: hiString(json['id']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify => true;

  Widget cell<M extends HiModel>(HiModelCallback<M>? callback) {
    return Container(
      color: hiRandomColor,
      height: 100,
    );
  }
}

// mixin HiModel {
//   final String id = '';

//   bool get isValid => id.isNotEmpty;
// }

// abstract class ModelType {
//   final String id;

//   ModelType({required this.id});

//   bool get isValid => true;

//   factory ModelType.fromJson(Map<String, dynamic> json) {
//     throw UnimplementedError();
//   }

//   Map<String, dynamic> toJson();
// }

// class HiModel {

//   HiModel();

//   factory HiModel.fromJson(Map<String, dynamic> json) {
//     throw UnimplementedError();
//   }

//   Map<String, dynamic> toJson() {
//     throw UnimplementedError();
//   }

//   String get className => runtimeType.toString();
// }
