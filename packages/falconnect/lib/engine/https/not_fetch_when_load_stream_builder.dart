import 'dart:async';
import 'package:falconnect/falconnect.dart';
import 'package:falmodel/falmodel.dart';
import 'package:faltool/faltool.dart';

class NotFetchWhenLoadingStreamBuilder<T> {
  Status? _status;
  StreamSubscription? subscription;

  final _subject = PublishSubject<Resource<T>>();

  Stream<Resource<T>> call({required Stream<Resource<T>> Function() fetch}) {
    if (_status != Status.loading) {
      if (subscription != null) {
        subscription?.cancel();
      }
      subscription = fetch().listen((Resource<T> data) {
        _status = data.status;
        if (_status == Status.exception || _status == Status.success) {
          subscription?.cancel();
        }
        _subject.add(data);
      }, onError: (error,stackTrace) {
        _subject.add(Resource.exception(error: error,stackTrace:stackTrace));
        subscription?.cancel();
      }, onDone: () {
        subscription?.cancel();
      });
    }
    return _subject.stream;
  }
}
