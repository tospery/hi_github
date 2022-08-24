import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'commit.dart';

part 'payload.g.dart';

@JsonSerializable()
class Payload extends Equatable {
  @JsonKey(name: 'push_id')
  final int? pushId;
  final int? size;
  @JsonKey(name: 'distinct_size')
  final int? distinctSize;
  final String? ref;
  final String? head;
  final String? before;
  final List<Commit>? commits;

  const Payload({
    this.pushId,
    this.size,
    this.distinctSize,
    this.ref,
    this.head,
    this.before,
    this.commits,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return _$PayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PayloadToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      pushId,
      size,
      distinctSize,
      ref,
      head,
      before,
      commits,
    ];
  }
}
