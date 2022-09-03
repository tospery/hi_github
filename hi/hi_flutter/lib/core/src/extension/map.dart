import 'dart:convert';
import '../function.dart';

extension HiCoreMapEx<K, V> on Map<K, V> {
  bool? boolForKey(K key) => hiBool(this[key]);
  int? intForKey(K key) => hiInt(this[key]);
  double? doubleForKey(K key) => hiDouble(this[key]);
  String? stringForKey(K key) => hiString(this[key]);

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

  Map<K, V> addIfNotExist(Map<K, V> other) {
    // if (this[key] != null) {
    //   return this;
    // }
    // var result = this;
    // result[key] = value;
    // return result;
    if (other.isEmpty) {
      return this;
    }
    var result = <K, V>{};
    result.addAll(this);
    for (var key in other.keys) {
      if (result[key] != null) {
        continue;
      }
      result[key] = other[key] as V;
    }
    return result;
  }

  Map<K, V> operator +(Map<K, V> other) {
    addAll(other);
    return this;
  }
}
