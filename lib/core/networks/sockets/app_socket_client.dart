import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
class SocketOp {
  static const CREATE_CHANNEL = 0;
  static const CLOSE_CHANNEL = 1;
  static const JOIN_CHANNEL = 2;
  static const LEAVE_CHANNEL = 3;
  static const INFO_CHANNEL = 4;
  static const MSG_CHANNEL = 5;
  static const PROD_CHANNEL = 6;
  static const JOIN_DASHBOARD = 7;
  static const LEAVE_DASHBOARD = 8;
  static const JOIN_CHAT = 9;
  static const LEAVE_CHAT = 10;
  static const CLOSE_CHAT = 11;
  static const MSG_CHAT = 12;
  static const NEW_CHAT = 13;
  static const INFO_CHAT = 14;

  static bool isJoinChannelStr(String response) => _checkOpStr(SocketOp.JOIN_CHANNEL, response);

  static bool isInfoChannelStr(String response) => _checkOpStr(SocketOp.INFO_CHANNEL, response);

  static bool isMsgChannelStr(String response) => _checkOpStr(SocketOp.MSG_CHANNEL, response);

  static bool isProductChannelStr(String response) => _checkOpStr(SocketOp.PROD_CHANNEL, response);

  static bool isMessageChat(String response) => _checkOpStr(SocketOp.MSG_CHAT, response);

  static bool isNewChat(String response) => _checkOpStr(SocketOp.NEW_CHAT, response);

  static bool isInfoChat(String response) => _checkOpStr(SocketOp.INFO_CHAT, response);

  static bool _checkOpStr(int op, String response) {
    try {
      final map = json.decode(response) as Map<String, dynamic>;
      final opTmp = map['op'];
      if (opTmp is int) {
        return opTmp == op;
      } else {
        return int.parse(opTmp) == op;
      }
    } on FormatException catch (e) {
      Log.e(e);
      return false;
    } on Exception catch (e) {
      Log.e(e);
      return false;
    }
  }
}

class AppSocketClient<T extends SocketResponseX> extends SocketClientX {
  AppSocketClient(String baseUrl) : super(baseUrl);

  @override
  void setupConfig(SocketOptions configs) {
    configs.retryLimit = 3;
  }

  @override
  void setupInterceptors(SocketInterceptors interceptors) {
    interceptors.addAll([SocketLogInterceptor()]);
  }
}
