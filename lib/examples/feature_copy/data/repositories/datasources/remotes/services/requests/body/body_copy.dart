import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class YourBody extends RequestBodyX {
  const YourBody({
    required this.data,
  });

  static const String DATA_FIELD = 'data';

  final String? data;

  @override
  Map<String, Object?> toJson() => {
    DATA_FIELD: data,
  }.removeNullOrEmptyString();

  @override
  List<Object?> get props => <Object?>[
    data,
  ];

  static YourBody fromJsonStr(String data) =>
      YourBody.fromJson(json.decode(data));

  static YourBody fromJson(Map<String, dynamic> json) {
    return YourBody(
      data: json[DATA_FIELD] as String,
    );
  }

}
