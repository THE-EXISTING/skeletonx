import 'package:skeletonx/core/core.dart';

class AppPermission {
  static const CAMERA = 'CAMERA';
  static const MICROPHONE = 'MICROPHONE';
  static const STORAGE = 'STORAGE';

  final all = <String, Permission>{
    CAMERA: Permission.camera,
    MICROPHONE: Permission.microphone,
    STORAGE: Permission.storage
  };

  Future<bool> isCameraGranted({BuildContext? context}) => _isGranted(
        CAMERA,
        context: context,
      );

  Future<bool> isMicrophoneGranted({BuildContext? context}) => _isGranted(
        MICROPHONE,
        context: context,
      );

  Future<bool> isStorageGranted({BuildContext? context}) => _isGranted(
        STORAGE,
        context: context,
      );

  Future<bool> isCameraPermanentlyDenied() =>
      _requestCamera().isPermanentlyDenied;

  Future<bool> isMicrophonePermanentlyDenied() =>
      _requestMicrophone().isPermanentlyDenied;

  Future<bool> isStoragePermanentlyDenied() =>
      _requestStorage().isPermanentlyDenied;

  ///========================= PRIVATE METHOD =========================///
  Future<PermissionStatus> _requestMicrophone() => all[MICROPHONE]!.request();

  Future<PermissionStatus> _requestStorage() => all[STORAGE]!.request();

  Future<PermissionStatus> _requestCamera() => all[CAMERA]!.request();

  Future<bool> _isGranted(String tag, {BuildContext? context}) async {
    if (context == null) {
      return _requestCamera().isGranted;
    } else {
      final PermissionStatus status = await all[tag]!.status;
      if (status.isDenied) {
        //TODO: Show modal with context
        throw UnimplementedError();
      } else {
        return Future.value(true);
      }
    }
  }
}
