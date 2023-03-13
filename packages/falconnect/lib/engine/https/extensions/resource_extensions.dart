import 'package:falconnect/falconnect.dart';
import 'package:falmodel/falmodel.dart';

extension FutureResource<T> on Future<T?> {
  Future<Resource<T>> mapToSuccessResource() async {
    return then((data) => Resource.success<T>(data: data));
  }
}

extension StreamResource<T> on Stream<T?> {
  Stream<Resource<T>> mapToSuccessResource() {
    return map((data) => Resource.success<T>(data: data));
  }
}
