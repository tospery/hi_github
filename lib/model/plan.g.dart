// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      name: json['name'] as String? ?? 'free',
      space: json['space'] as int? ?? 0,
      collaborators: json['collaborators'] as int? ?? 0,
      privateRepos: json['private_repos'] as int? ?? 0,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'name': instance.name,
      'space': instance.space,
      'collaborators': instance.collaborators,
      'private_repos': instance.privateRepos,
    };
