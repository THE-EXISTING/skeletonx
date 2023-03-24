import 'package:skeletonx/core/core.dart';

class IngredientModel with EquatableMixin {
  const IngredientModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isAlcohol,
  });

  final String id;
  final String name;
  final String description;
  final bool isAlcohol;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        isAlcohol,
      ];

  @override
  bool? get stringify => true;

  static IngredientModel fromResponse(IngredientResponse response) =>
      IngredientModel(
        id: response.idIngredient!,
        name: response.strIngredient ?? '',
        description: response.strDescription ?? '',
        isAlcohol: response.strAlcohol?.toLowerCase() == 'yes' ? true : false,
      );
}
