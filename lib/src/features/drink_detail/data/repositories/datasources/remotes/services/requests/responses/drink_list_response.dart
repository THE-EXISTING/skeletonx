import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class DrinkListResponse extends ResponseDataX {
  const DrinkListResponse({required this.drinks});

  final List<DrinkResponse> drinks;

  @override
  List<Object?> get props => [drinks];

  static DrinkListResponse fromJsonStr(String str) =>
      DrinkListResponse.fromJson(json.decode(str));

  static DrinkListResponse fromJson(Map<String, dynamic> json) =>
      DrinkListResponse(
        drinks: List<DrinkResponse>.from(
          (json['drinks'] != null)
              ? json['drinks'].map((x) => DrinkResponse.fromJson(x))
              : [],
        ),
      );
}
