import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan.g.dart';

@JsonSerializable()
class Plan extends Equatable {
  final String? name;
  final int? space;
  final int? collaborators;
  @JsonKey(name: 'private_repos')
  final int? privateRepos;

  const Plan({
    this.name,
    this.space,
    this.collaborators,
    this.privateRepos,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  Plan copyWith({
    String? name,
    int? space,
    int? collaborators,
    int? privateRepos,
  }) {
    return Plan(
      name: name ?? this.name,
      space: space ?? this.space,
      collaborators: collaborators ?? this.collaborators,
      privateRepos: privateRepos ?? this.privateRepos,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, space, collaborators, privateRepos];
}
