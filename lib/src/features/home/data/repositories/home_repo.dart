import 'package:skeletonx/core/core.dart';

import 'datasources/remotes/home_remote_datasources.dart';

class HomeRepository {
  HomeRepository({
    HomeRemoteDataSources? homeRemote,
  }) : _homeRemote = homeRemote ?? HomeRemoteDataSources();

  final HomeRemoteDataSources _homeRemote;

  Stream<Resource<List<DrinkModel>>> searchDrinkByName(
          {required String name}) =>
      NetworkBoundResource.asStream<List<DrinkModel>, DrinkListResponse>(
        createCallFuture: () => _homeRemote.searchDrinkByName(name: name),
        processResponse: (response) => response.drinks
            .map((response) => DrinkModel.fromResponse(response))
            .toList(),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<DrinkModel>> getDrinkById({required String id}) =>
      NetworkBoundResource.asStream<DrinkModel, DrinkResponse>(
        createCallFuture: () => _homeRemote.getDrinkById(id: id),
        processResponse: (response) => DrinkModel.fromResponse(response),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<DrinkModel>> randomDrink() =>
      NetworkBoundResource.asStream<DrinkModel, DrinkResponse>(
        createCallFuture: () => _homeRemote.randomDrink(),
        processResponse: (response) => DrinkModel.fromResponse(response),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );


  Stream<Resource<List<DrinkModel>>> get4RandomDrink() =>
      NetworkBoundResource.asStream<List<DrinkModel>, List<DrinkResponse>>(
        createCallFuture: () => _homeRemote.get4RandomDrink(),
        processResponse: (response) => response
            .map((response) => DrinkModel.fromResponse(response))
            .toList(),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<List<DrinkModel>>> filterByAlcoholic({required bool isAlcoholic}) =>
      NetworkBoundResource.asStream<List<DrinkModel>, DrinkListResponse>(
        createCallFuture: () => _homeRemote.filterByAlcoholic(isAlcoholic: isAlcoholic),
        processResponse: (response) => response.drinks
            .map((response) => DrinkModel.fromResponse(response))
            .toList(),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );
}
