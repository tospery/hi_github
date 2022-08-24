import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'payload.dart';
import 'repository.dart';
import 'user.dart';

part 'event.g.dart';

@JsonSerializable()
class Event extends Equatable {
  final String id;
  final String type;
  final bool public;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final User? actor;
  final Repository? repo;
  final Payload? payload;

  const Event({
    this.id = '0',
    this.type = '',
    this.public = true,
    this.createdAt = '',
    this.actor,
    this.repo,
    this.payload,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      type,
      public,
      createdAt,
      actor,
      repo,
      payload,
    ];
  }
}
