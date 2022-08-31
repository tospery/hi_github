import 'dart:convert';
import 'function.dart';

extension HiCoreMapEx<K, V> on Map<K, V> {
  String? stringForKey(K key) {
    return hiString(this[key]);
  }

  bool? boolForKey(K key) {
    // return hiString(this[key]);
    return null;
  }

  V? valueForKeys(List<K> keys) {
    V? v;
    for (K k in keys) {
      V? temp = this[k];
      if (temp != null) {
        v = temp;
        break;
      }
    }
    return v;
  }

  Map<K, dynamic> get singleValueMap {
    Map<K, dynamic> result = {};
    forEach((key, value) {
      if (value is List) {
        result[key] = value.first;
      } else {
        result[key] = value;
      }
    });
    return result;
  }

  String get jsonString {
    return json.encode(this);
  }

  Map<K, V> operator +(Map<K, V> other) {
    addAll(other);
    return this;
  }
}
