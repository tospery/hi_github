import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository extends Equatable {
  final int? id;
  final String? name;
  final String? url;

  const Repository({this.id, this.name, this.url});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return _$RepositoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, url];
}
