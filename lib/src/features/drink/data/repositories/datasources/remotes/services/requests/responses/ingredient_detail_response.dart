import 'package:skeletonx/core/core.dart';

class IngredientResponse extends ResponseDataX {
  const IngredientResponse({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
    this.strAlcohol,
    this.strABV,
  });

  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;
  final String? strType;
  final String? strAlcohol;
  final String? strABV;

  @override
  List<Object?> get props => [
        idIngredient,
        strIngredient,
        strDescription,
        strType,
        strAlcohol,
        strABV,
      ];

  static IngredientResponse fromJsonStr(String data) =>
      IngredientResponse.fromJson(json.decode(data));

  static IngredientResponse fromJson(Map<String, dynamic> json) =>
      IngredientResponse(
        idIngredient: json['idIngredient'] as String?,
        strIngredient: json['strIngredient'] as String?,
        strDescription: json['strDescription'] as String?,
        strType: json['strType'] as String?,
        strAlcohol: json['strAlcohol'] as String?,
        strABV: json['strABV'] as String?,
      );
}
