import 'dart:async';
import 'package:falmodel/falmodel.dart';
import 'package:faltool/faltool.dart';

class Fetcher<T extends Resource> {
  StreamSubscription? subscription;

  void fetch(
    Stream<T> call, {
    required Function(T data) onResource,
  }) async {
    if (subscription != null) {
      subscription?.cancel();
    }
    subscription = call.listen((T data) {
      final status = data.status;
      if (status == Status.exception || status == Status.success) {
        subscription?.cancel();
      }
      onResource(data);
    }, onError: (error, stackTrace) {
      Log.e(error);
      subscription?.cancel();
    }, onDone: () {
      subscription?.cancel();
    });
  }

  void close() {
    subscription?.cancel();
  }
}
