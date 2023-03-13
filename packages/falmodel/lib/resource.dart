import 'package:equatable/equatable.dart';
import 'package:falmodel/falmodel.dart';
import 'package:flutter/foundation.dart';

enum Status { init, loading, success, exception }

@immutable
class Resource<T> with EquatableMixin {
  const Resource._(
      {this.data,
      required this.status,
      this.message,
      this.error,
      this.stackTrace});

  final Status status;
  final T? data;
  final String? message;
  final Object? error;
  final StackTrace? stackTrace;

  static Resource<T> init<T>({T? data}) =>
      Resource<T>._(data: data, status: Status.init);

  static Resource<T> loading<T>({T? data}) =>
      Resource<T>._(data: data, status: Status.loading);

  static Resource<T> success<T>({T? data}) =>
      Resource<T>._(data: data, status: Status.success);

  static Resource<T> exception<T>(
          {T? data, Object? error, StackTrace? stackTrace}) =>
      Resource<T>._(
          error: error,
          data: data,
          status: Status.exception,
          stackTrace: stackTrace);

  bool isInit() => status == Status.init;

  bool isLoading() => status == Status.loading;

  bool isNotLoading() => status != Status.loading;

  bool isLoadingOrInit() => isLoading() || isInit();

  bool isSuccess() => status == Status.success;

  bool isNotSuccess() => status != Status.success;

  bool isSuccessWithData() => status == Status.success && data != null;

  bool isException() => status == Status.exception;

  bool isNotException() => status != Status.exception;

  @override
  List<Object?> get props => [status, data, message, error, stackTrace];

  @override
  bool get stringify => true;

  Resource<A> transformData<A>(A? newData) {
    return Resource._(
      data: newData,
      status: status,
      message: message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
