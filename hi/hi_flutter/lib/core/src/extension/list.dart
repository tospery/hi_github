import 'dart:convert' as convert;

extension ListHiCoreEx<E> on List<E> {
  String toJsonString() => convert.json.encode(this);
}
