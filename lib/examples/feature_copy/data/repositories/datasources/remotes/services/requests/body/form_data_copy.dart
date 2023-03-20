import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class YourFormData extends FormDataBodyX {
  const YourFormData({
    required this.name,
    required this.category,
    required this.imagePathList,
    required this.isVisible,
    required this.isDiscounting,
  });

  static const String NAME_FIELD = 'name';
  static const String CATEGORY_FIELD = 'category';
  static const String IMAGES_FIELD = 'images';
  static const String VISIBLE_FIELD = 'isVisible';
  static const String IS_DISCOUNT_FIELD = 'isDiscounting';

  final String name;
  final String category;
  final bool isVisible;
  final List<String> imagePathList;
  final bool isDiscounting;

  @override
  Map<String, Object?> toJson() => {
    NAME_FIELD: name,
    CATEGORY_FIELD: category,
    VISIBLE_FIELD: isVisible,
    IS_DISCOUNT_FIELD: isDiscounting,
  }.removeNullOrEmptyString();

  @override
  List<Object?> get props => <Object?>[
    category,
    isVisible,
    imagePathList,
    isDiscounting
  ];

  @override
  Future<FormData> toFormData() async {
    final FormData formData = FormData.fromMap(toJson());
    for (var i = 0; i < (imagePathList.length); i++) {
      formData.files.addAll(
        [
          MapEntry(
            IMAGES_FIELD,
            await MultipartFile.fromFile(imagePathList[i]),
          ),
        ],
      );
    }
    return formData;
  }
}
