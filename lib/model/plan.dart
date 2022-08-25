import 'package:hi_flutter/hi_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan.g.dart';

@JsonSerializable()
class Plan extends Equatable {
  final String name;
  final int space;
  final int collaborators;
  @JsonKey(name: 'private_repos')
  final int privateRepos;

  const Plan({
    this.name = 'free',
    this.space = 0,
    this.collaborators = 0,
    this.privateRepos = 0,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, space, collaborators, privateRepos];
}
