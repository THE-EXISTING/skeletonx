import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class YourResponse extends ResponseDataX {
  const YourResponse({
    required this.data,
    required this.dataList,
  });

  static const String DATA_FIELD = 'data';
  static const String DATA_LIST_FIELD = 'data_list';

  final String data;
  final List<YourResponse> dataList;

  @override
  List<Object?> get props => <Object?>[
        data,
        dataList,
      ];

  static YourResponse fromJsonStr(String data) =>
      YourResponse.fromJson(json.decode(data));

  static YourResponse fromJson(Map<String, dynamic> json) => YourResponse(
        data: json[DATA_FIELD] as String,
        dataList: List<YourResponse>.from(
            json[DATA_LIST_FIELD].map((x) => YourResponse.fromJson(x))),
      );
}
