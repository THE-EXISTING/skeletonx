import 'package:skeletonx/core/core.dart';

class ImageCompress {
  static const int _megaByte = 1048576;

  static Future<List<AssetEntity>?> callList(List<AssetEntity?>? assetListEntity, {
    required int sizeLimitMB,
    Function? onError,
    Function()? onSuccess,
  }) async {
    if (assetListEntity == null) return null;
    if (assetListEntity.isEmptyOrNull) return null;
    assetListEntity.removeWhere((element) => element == null);
    final allImageSize = await assetListEntity.mapAsync((data) async {
      final File? imageFile = await data?.file;
      if (imageFile != null) {
        final Uint8List imageAsByte = await imageFile.readAsBytes();
        final imageSizeMb = imageAsByte.lengthInBytes / _megaByte;
        return imageSizeMb;
      } else {
        return 0;
      }
    });
    final allImageSizeSum = allImageSize.reduce((value, element) => value + element);
    if (allImageSizeSum < 10) {
      onSuccess?.call();
    }else {
      onError?.call();
    }
    return null;
  }

  static Future<File?> call(AssetEntity? assetEntity, {
    required int sizeLimitMB,
    Function? onError,
    Function(File)? onSuccess,
  }) async {
    if (assetEntity == null) return null;
    final File? imageFile = await assetEntity.file;
    if (imageFile != null) {
      final imagePath = imageFile.path;
      final Uint8List imageAsByte = await imageFile.readAsBytes();
      final imageSizeMb = imageAsByte.lengthInBytes / _megaByte;
      Log.d('imageSizeMb : $imageSizeMb');
      if (imageSizeMb < sizeLimitMB) {
        onSuccess?.call(imageFile);
        return imageFile;
      } else if (imageSizeMb < sizeLimitMB * 2) {
        final dir = await getTemporaryDirectory();
        final target = '${dir.absolute.path}/${DateTime
            .now()
            .millisecondsSinceEpoch}.jpg';
        final resultImg = await FlutterImageCompress.compressAndGetFile(
          imagePath,
          target,
          quality: 90,
        );
        final resultImgByte = await resultImg!.readAsBytes();
        final resultImgSize = resultImgByte.lengthInBytes / 1048576;
        Log.d('resultImgSize : $resultImgSize');
        onSuccess?.call(resultImg);
        return resultImg;
      } else {
        onError?.call();
      }
    }
    return null;
  }
}
