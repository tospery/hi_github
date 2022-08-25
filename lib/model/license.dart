import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable()
class License extends Equatable {
  final String? key;
  final String? name;
  @JsonKey(name: 'spdx_id')
  final String? spdxId;
  final String? url;
  @JsonKey(name: 'node_id')
  final String? nodeId;

  const License({this.key, this.name, this.spdxId, this.url, this.nodeId});

  factory License.fromJson(Map<String, dynamic> json) {
    return _$LicenseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LicenseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [key, name, spdxId, url, nodeId];
}
