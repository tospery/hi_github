import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'commit.g.dart';

@JsonSerializable()
class Commit extends Equatable {
  final String? sha;
  final User? author;
  final String? message;
  final bool? distinct;
  final String? url;

  const Commit({
    this.sha,
    this.author,
    this.message,
    this.distinct,
    this.url,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    return _$CommitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommitToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [sha, author, message, distinct, url];
}
