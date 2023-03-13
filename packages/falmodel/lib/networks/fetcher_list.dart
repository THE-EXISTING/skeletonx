import 'package:falmodel/falmodel.dart';

class FetcherList {
  final Map<dynamic, Fetcher> _fetcherMap = {};

  void fetch<T extends Resource>({
    required Object key,
    required Stream<T> call,
    required Function(T data) onResource,
  }) async {
    _closeFetcherByKey(key);

    Fetcher<T>? fetcher = _fetcherMap[key] as Fetcher<T>?;
    if (fetcher == null) {
      fetcher = Fetcher<T>();
      _fetcherMap[key] = fetcher;
    }

    fetcher.fetch(
      call,
      onResource: onResource,
    );
  }

  void _closeFetcherByKey(dynamic key) {
    final fetcher = _fetcherMap[key];
    fetcher?.close();
  }

  void close() {
    _fetcherMap.forEach((key, fetcher) => fetcher.close());
  }
}
