import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/home/data/repositories/datasources/remotes/services/home_api_service.dart';

class HomeRemoteDataSources {
  HomeRemoteDataSources({
    HomeApiServices? homeApi,
  }) : _homeApi = homeApi ?? HomeApiServices();

  final HomeApiServices _homeApi;

  Future<DrinkListResponse> searchDrinkByName({required String name}) async =>
      await _homeApi.searchDrinkByName(name: name).unWrapResponse();

  Future<DrinkResponse> getDrinkById({required String id}) async =>
      await _homeApi
          .getDrinkById(id: id)
          .unWrapResponse()
          .then((list) => list.drinks[0]);

  Future<IngredientListResponse> searchIngredientByName(
      {required String name}) async =>
      await _homeApi.searchIngredientByName(name: name).unWrapResponse();

  Future<IngredientResponse> getIngredientById({required String id}) async =>
      await _homeApi
          .getIngredientById(id: id)
          .unWrapResponse()
          .then((list) => list.ingredients[0]);

  Future<DrinkResponse> randomDrink() async => await _homeApi
      .randomDrink()
      .unWrapResponse()
      .then((list) => list.drinks[0]);

  Future<List<DrinkResponse>> get4RandomDrink() async {
    List<DrinkResponse> list = [];
    await Future.wait([
      _homeApi.randomDrink().unWrapResponse().then((list) => list.drinks[0]),
      _homeApi.randomDrink().unWrapResponse().then((list) => list.drinks[0]),
      _homeApi.randomDrink().unWrapResponse().then((list) => list.drinks[0]),
      _homeApi.randomDrink().unWrapResponse().then((list) => list.drinks[0])
    ]).then((listDrink) {
      list.addAll(listDrink);
    });
    return list;
  }

  Future<DrinkListResponse> filterByAlcoholic({required bool isAlcoholic}) async {
    String name = isAlcoholic ? 'Alcoholic' : 'Non_Alcoholic';
    return await  _homeApi.filterByAlcoholic(name: name).unWrapResponse();
  }
}
