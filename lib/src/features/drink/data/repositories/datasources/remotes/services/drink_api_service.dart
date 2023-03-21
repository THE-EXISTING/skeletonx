// ignore_for_file: constant_identifier_names,non_constant_identifier_names
import 'package:skeletonx/core/core.dart';

/// API spec link: https://www.thecocktaildb.com/api.php
class DrinkApiService extends AppApiService {
  static const URL_SEARCH = 'api/json/v1/1/search.php';
  static const URL_LOOKUP = 'api/json/v1/1/lookup.php';
  static const URL_RANDOM = 'api/json/v1/1/random.php';

  DrinkApiService();

  Future<Response<DrinkListResponse>> searchDrinkByName(
      {required String name}) {
    return get(URL_SEARCH,
        queryParameters: {'s': name},
        converter: (json) => DrinkListResponse.fromJson(json),
        isUseToken: false);
  }

  Future<Response<DrinkListResponse>> searchDrinkByLetter(
      {required String letter}) {
    return get(URL_SEARCH,
        queryParameters: {'f': letter},
        converter: (json) => DrinkListResponse.fromJson(json),
        isUseToken: false);
  }

  Future<Response<DrinkListResponse>> getDrinkById({required String id}) {
    return get(URL_LOOKUP,
        queryParameters: {'i': id},
        converter: (json) => DrinkListResponse.fromJson(json),
        isUseToken: false);
  }

  Future<Response<IngredientListResponse>> searchIngredientByName(
      {required String name}) {
    return get(URL_SEARCH,
        queryParameters: {'i': name},
        converter: (json) => IngredientListResponse.fromJson(json),
        isUseToken: false);
  }

  Future<Response<IngredientListResponse>> getIngredientById(
      {required String id}) {
    return get(URL_LOOKUP,
        queryParameters: {'iid': id},
        converter: (json) => IngredientListResponse.fromJson(json),
        isUseToken: false);
  }

  Future<Response<DrinkListResponse>> randomDrink() {
    return post(URL_RANDOM,
        converter: (json) => DrinkListResponse.fromJson(json),
        isUseToken: false);
  }
}
