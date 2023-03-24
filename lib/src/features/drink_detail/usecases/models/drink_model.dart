import 'package:skeletonx/core/core.dart';

class DrinkModel with EquatableMixin {
  const DrinkModel({
    required this.id,
    required this.name,
    required this.instruction,
    required this.category,
    required this.thumbnailUrl,
    required this.imgUrl,
    required this.videoUrl,
    required this.ingredients,
  });

  final String id;
  final String name;
  final String instruction;
  final String category;
  final String thumbnailUrl;
  final String imgUrl;
  final String videoUrl;
  final Set<IngredientModel> ingredients;

  @override
  List<Object?> get props => [
        id,
        name,
        instruction,
        category,
        thumbnailUrl,
        imgUrl,
        videoUrl,
        ingredients,
      ];

  @override
  bool? get stringify => true;

  static DrinkModel fromResponse(DrinkResponse response) => DrinkModel(
        id: response.idDrink!,
        name: response.strDrink!,
        instruction: response.strInstructions!,
        category: response.strCategory ?? '',
        thumbnailUrl: response.strDrinkThumb!,
        imgUrl: response.strImageSource ?? '',
        videoUrl: response.strVideo ?? '',
        ingredients: _getIngredients(response),
      );

  static Set<String> _getIngredients(DrinkResponse response) {
    var ingredients = [
      response.strIngredient1,
      response.strIngredient2,
      response.strIngredient3,
      response.strIngredient4,
      response.strIngredient5,
      response.strIngredient6,
      response.strIngredient7,
      response.strIngredient8,
      response.strIngredient9,
      response.strIngredient10,
      response.strIngredient11,
      response.strIngredient12,
      response.strIngredient13,
      response.strIngredient14,
      response.strIngredient15,
    ];

    return ingredients.whereNotNull().toSet();
  }
}
