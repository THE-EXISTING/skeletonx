import 'package:skeletonx/core/core.dart';

class DrinkRemoteDataSources {
  DrinkRemoteDataSources({
    DrinkApiService? drinkApi,
  }) : _drinkApi = drinkApi ?? DrinkApiService();

  final DrinkApiService _drinkApi;

  Future<DrinkListResponse> searchDrinkByName({required String name}) async =>
      await _drinkApi.searchDrinkByName(name: name).unWrapResponse();

  Future<DrinkResponse> getDrinkById({required String id}) async =>
      await _drinkApi
          .getDrinkById(id: id)
          .unWrapResponse()
          .then((list) => list.drinks[0]);

  Future<IngredientResponse> searchIngredientByName(
          {required String name}) async =>
      await _drinkApi
          .searchIngredientByName(name: name)
          .unWrapResponse()
          .then((list) => list.ingredients[0]);

  Future<IngredientResponse> getIngredientById({required String id}) async =>
      await _drinkApi
          .getIngredientById(id: id)
          .unWrapResponse()
          .then((list) => list.ingredients[0]);

  Future<DrinkResponse> randomDrink() async => await _drinkApi
      .randomDrink()
      .unWrapResponse()
      .then((list) => list.drinks[0]);

  Future<Two<DrinkResponse, List<IngredientResponse>>>
      getDrinkWithIngredientsById({required String id}) async {
    // Drink response
    DrinkResponse drinkResponse = await getDrinkById(id: id);

    // Ingredient response list
    List<IngredientResponse> ingredientResponseList = [];

    final ingredientNames = _getIngredientNames(drinkResponse);

    for (var ingredientName in ingredientNames) {
      final ingredientResponse =
          await searchIngredientByName(name: ingredientName);
      ingredientResponseList.add(ingredientResponse);
    }

    return Two(first: drinkResponse, second: ingredientResponseList);
  }

  static Set<String> _getIngredientNames(DrinkResponse response) {
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
