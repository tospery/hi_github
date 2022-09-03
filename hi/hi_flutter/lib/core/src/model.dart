import 'package:equatable/equatable.dart';

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
}
