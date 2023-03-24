import 'package:skeletonx/core/core.dart';

class DrinkRepository {
  DrinkRepository({
    DrinkRemoteDataSources? drinkRemote,
  }) : _drinkRemote = drinkRemote ?? DrinkRemoteDataSources();

  final DrinkRemoteDataSources _drinkRemote;

  Stream<Resource<List<DrinkModel>>> searchDrinkByName(
          {required String name}) =>
      NetworkBoundResource.asStream<List<DrinkModel>, DrinkListResponse>(
        createCallFuture: () => _drinkRemote.searchDrinkByName(name: name),
        processResponse: (response) => response.drinks
            .map((response) => DrinkModel.fromResponse(response))
            .toList(),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<DrinkModel>> getDrinkById({required String id}) =>
      NetworkBoundResource.asStream<DrinkModel, DrinkResponse>(
        createCallFuture: () => _drinkRemote.getDrinkById(id: id),
        processResponse: (response) => DrinkModel.fromResponse(response, ),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );

  Stream<Resource<DrinkModel>> randomDrink() =>
      NetworkBoundResource.asStream<DrinkModel, DrinkResponse>(
        createCallFuture: () => _drinkRemote.randomDrink(),
        processResponse: (response) => DrinkModel.fromResponse(response),
        error: (exception, stackTrace) {
          Log.e(exception, stackTrace);
        },
      );
}
