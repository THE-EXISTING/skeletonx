import 'package:skeletonx/core/core.dart';

abstract class AppSocketService implements RequestSocketService {
  final AppSocketClient _client;

  Timer? _timerCheckConnection;

  AppSocketService({AppSocketClient? client})
      : _client = client ?? AppSocketClient(AppConfig.socketBaseUrl);

  void startCheckConnectionInterval() {
    _timerCheckConnection?.cancel();
    // request(PingChannelBody.jsonStr());
    // _timerCheckConnection =
    //     Timer.periodic(const Duration(seconds: 5), (Timer t) async {
    //   await _client.checkConnection();
    //   return; //Don't forget to call return;
    // });
  }

  @override
  void createChannel() => _client.createChannel();

  @override
  void request(String data) => _client.request(data);

  @override
  Future<void> closeChannel() {
    _timerCheckConnection?.cancel();
    _client.setIsClose = false;
    return _client.closeChannel();
  }

  @override
  Stream<T> getResponseStream<T>({
    bool Function(SocketResponseX response)? filter,
    required T Function(SocketResponseX response) converter,
  }) =>
      _client.getResponseStream(filter: filter, converter: converter);

  @override
  Stream<SocketResponseX> getRawStream({
    bool Function(SocketResponseX response)? filter,
  }) =>
      _client.getRawStream(filter: filter);
}
