import 'dart:async';

import 'package:faltool/faltool.dart';

extension ListExtensionX<V> on List<V> {
  List<V> removeNulls() => removeNullsFromList(this);

  Future<List<T>> mapAsync<T>(Future<T> Function(V e) toElement) async =>
      await Future.wait(map((e) async => await toElement(e)));

  List<V> copy() => toList();

  bool edit(
      bool Function(V element) toElement, V Function(V oldData) editData) {
    final index = indexWhere(toElement);
    if (index != -1) {
      this[index] = editData(this[index]);
      return true;
    }
    return false;
  }

  V? firstWhereOrNull(bool Function(V element) predicate) {
    for (V element in this) {
      if (predicate(element)) return element;
    }
    return null;
  }
}

extension ListNullableExtensionX<V> on List<V>? {
  bool get isEmptyOrNull => this == null || this?.isEmpty == true;

  bool get isNull => this == null;
  
  bool get isNotNull => this != null;

  Future<List<T>> futureAsyncMap<T>(
      FutureOr<T> Function(V element) toElement) async {
    return this != null
        ? await Stream.fromIterable(this!)
            .asyncMap((event) => toElement(event))
            .toList()
        : [];
  }
}
