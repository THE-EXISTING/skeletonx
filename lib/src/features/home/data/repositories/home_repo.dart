import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/home/usecases/models/drink_model.dart';

import 'datasources/remotes/home_remote_datasources.dart';

class HomeRepository {
  HomeRepository({
    HomeRemoteDataSources? homeRemote,
  }) : _homeRemote = homeRemote ?? HomeRemoteDataSources();

  final HomeRemoteDataSources _homeRemote;

  Stream<Resource<List<HomeDrinkModel>>> searchDrinkByName(
          {required String name}) =>
      NetworkBoundResource.asStream<List<HomeDrinkModel>, DrinkListResponse>(
        createCallFuture: () => _homeRemote.searchDrinkByName(name: name),
        processResponse: (response) => response.drinks
            .map((response) => HomeDrinkModel.fromResponse(response))
            .toList(),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<HomeDrinkModel>> getDrinkById({required String id}) =>
      NetworkBoundResource.asStream<HomeDrinkModel, DrinkResponse>(
        createCallFuture: () => _homeRemote.getDrinkById(id: id),
        processResponse: (response) => HomeDrinkModel.fromResponse(response),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<HomeDrinkModel>> randomDrink() =>
      NetworkBoundResource.asStream<HomeDrinkModel, DrinkResponse>(
        createCallFuture: () => _homeRemote.randomDrink(),
        processResponse: (response) => HomeDrinkModel.fromResponse(response),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );


  Stream<Resource<List<HomeDrinkModel>>> get4RandomDrink() =>
      NetworkBoundResource.asStream<List<HomeDrinkModel>, List<DrinkResponse>>(
        createCallFuture: () => _homeRemote.get4RandomDrink(),
        processResponse: (response) => response
            .map((response) => HomeDrinkModel.fromResponse(response))
            .toList(),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<List<HomeDrinkModel>>> filterByAlcoholic({required bool isAlcoholic}) =>
      NetworkBoundResource.asStream<List<HomeDrinkModel>, DrinkListResponse>(
        createCallFuture: () => _homeRemote.filterByAlcoholic(isAlcoholic: isAlcoholic),
        processResponse: (response) => response.drinks
            .map((response) => HomeDrinkModel.fromResponse(response))
            .toList(),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );
}
