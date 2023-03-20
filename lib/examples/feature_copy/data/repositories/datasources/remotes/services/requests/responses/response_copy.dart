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
}
