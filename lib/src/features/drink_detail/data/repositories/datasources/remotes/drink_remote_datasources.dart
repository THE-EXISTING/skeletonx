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

  // Future<Two<DrinkResponse, List<IngredientResponse>>> getDrinkById(
  //     {required String id}) async {
  //   DrinkResponse drinkResponse = await _drinkApi
  //       .getDrinkById(id: id)
  //       .unWrapResponse()
  //       .then((list) => list.drinks[0]);
  //
  //   List<IngredientResponse> ingredientList = Future.wait(futures);
  //
  //   return Two(first: drinkResponse, second: ingredientList);
  // }

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
}
