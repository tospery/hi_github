import 'package:hi_flutter/hi_flutter.dart';

class Plan extends Equatable {
  final String name;
  final int space;
  final int collaborators;
  final int privateRepos;

  const Plan({
    this.name = 'free',
    this.space = 0,
    this.collaborators = 0,
    this.privateRepos = 0,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        name: json['name'] as String? ?? 'free',
        space: json['space'] as int? ?? 0,
        collaborators: json['collaborators'] as int? ?? 0,
        privateRepos: json['private_repos'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'space': space,
        'collaborators': collaborators,
        'private_repos': privateRepos,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, space, collaborators, privateRepos];
}
