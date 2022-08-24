// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String? ?? '0',
      type: json['type'] as String? ?? '',
      public: json['public'] as bool? ?? true,
      createdAt: json['created_at'] as String? ?? '',
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      repo: json['repo'] == null
          ? null
          : Repository.fromJson(json['repo'] as Map<String, dynamic>),
      payload: json['payload'] == null
          ? null
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'public': instance.public,
      'created_at': instance.createdAt,
      'actor': instance.actor,
      'repo': instance.repo,
      'payload': instance.payload,
    };
