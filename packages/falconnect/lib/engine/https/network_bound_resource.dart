import 'dart:async';
import 'package:falconnect/falconnect.dart';
import 'package:falconnect/utils/nlog.dart';
import 'package:falmodel/falmodel.dart';

class NetworkBoundResource<EntityType, ResponseType> {
  NetworkBoundResource._();

  static const String TAG = 'NetworkBoundResource';

  static Stream<Resource<EntityType>> asStream<EntityType, ResponseType>({
    Future<EntityType> Function()? loadFromDbFuture,
    bool Function(EntityType? data)? shouldFetch,
    required Future<ResponseType> Function() createCallFuture,
    FutureOr<EntityType> Function(ResponseType response)? processResponse,
    Future? Function(EntityType item)? saveCallResult,
    Function? error,
  }) async* {
    assert(
      ResponseType == EntityType ||
          (!(ResponseType == EntityType) && processResponse != null),
      'You need to specify the `processResponse` when the EntityType and ResponseType types are different',
    );
    // Start: inner function
    Stream<Resource<EntityType>> _fetchData() async* {
      try {
        final ResponseType response = await createCallFuture();
        NLog.i(TAG, 'Success fetch data');

        late EntityType data;
        if (processResponse != null) {
          final EntityType processedData = await processResponse(response);
          data = processedData;
        } else {
          final EntityType castData = response as EntityType;
          data = castData;
        }

        if (saveCallResult != null) {
          await saveCallResult(data);
          NLog.i(TAG, 'Success save result data');
        }
        yield Resource.success(data: data);
      } catch (exception, stackTrace) {
        try {
          error?.call(exception, stackTrace);
        } catch (newException, stackTrace) {
          if (newException is Exception) {
            yield Resource.exception(
                data: null, error: newException, stackTrace: stackTrace);
            return;
          }
        }
        NLog.e(TAG, 'Fetching failed', exception);
        yield Resource.exception(
            data: null, error: exception, stackTrace: stackTrace);
      }
    }
    // End: inner function

    NLog.i(TAG, 'Loading...');
    yield Resource.loading();
    if (loadFromDbFuture != null) {
      EntityType dataFromDb = await loadFromDbFuture();
      NLog.i(TAG, 'Success load data from database');
      if (shouldFetch != null && shouldFetch(dataFromDb)) {
        NLog.i(TAG, 'Loading... with data from database');
        yield Resource.loading(data: dataFromDb);
        yield* _fetchData();
      } else {
        NLog.i(TAG, 'Fetching data its not necessary');
        yield Resource.success(data: dataFromDb);
      }
    } else {
      yield* _fetchData();
    }
  }
}
