import 'package:hi_get/hi_get.dart';

class License extends Equatable {
  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  const License({this.key, this.name, this.spdxId, this.url, this.nodeId});

  factory License.fromJson(Map<String, dynamic> json) => License(
        key: json.stringForKey('key'),
        name: json.stringForKey('name'),
        spdxId: json.stringForKey('spdx_id'),
        url: json.stringForKey('url'),
        nodeId: json.stringForKey('node_id'),
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'name': name,
        'spdx_id': spdxId,
        'url': url,
        'node_id': nodeId,
      };

  License copyWith({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) {
    return License(
      key: key ?? this.key,
      name: name ?? this.name,
      spdxId: spdxId ?? this.spdxId,
      url: url ?? this.url,
      nodeId: nodeId ?? this.nodeId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [key, name, spdxId, url, nodeId];
}
