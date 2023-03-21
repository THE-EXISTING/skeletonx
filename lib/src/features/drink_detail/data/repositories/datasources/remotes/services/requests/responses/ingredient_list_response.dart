import 'package:skeletonx/core/core.dart';

// ignore_for_file: constant_identifier_names,non_constant_identifier_names
class IngredientListResponse extends ResponseDataX {
  const IngredientListResponse({required this.ingredients});

  final List<IngredientResponse> ingredients;

  @override
  List<Object?> get props => [ingredients];

  static IngredientListResponse fromJsonStr(String str) =>
      IngredientListResponse.fromJson(json.decode(str));

  static IngredientListResponse fromJson(Map<String, dynamic> json) =>
      IngredientListResponse(
        ingredients: List<IngredientResponse>.from(
          (json['ingredients'] != null)
              ? json['ingredients'].map((x) => IngredientResponse.fromJson(x))
              : [],
        ),
      );
}
