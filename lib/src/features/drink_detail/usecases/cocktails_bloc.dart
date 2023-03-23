import 'package:skeletonx/core/core.dart';

enum CocktailsEvent {
  loadDrinks,
}

class CocktailsBloc extends ScreenBlocX<CocktailsEvent,
    BlocEvent<CocktailsEvent>, Resource<List<DrinkModel>?>> {
  CocktailsBloc({
    DrinkRepository? cocktailRepo,
  })  : _cocktailRepo = cocktailRepo ?? DrinkRepository(),
        super(Resource.init());

  final DrinkRepository _cocktailRepo;

  @override
  Future<void> onListenEvent(BlocEvent<CocktailsEvent> event) async {
    switch (event.name) {
      case CocktailsEvent.loadDrinks:
        _fetchDrinks();
        break;
    }
  }

  ///========================= PRIVATE METHOD =========================///

  void _fetchDrinks() => fetch(
        key: CocktailsEvent.loadDrinks,
        call: _cocktailRepo.searchDrinkByName(name: 'martini'),
        onResource: (resource) {
          if (resource.isLoading()) {
            //TODO: Handle loading with your business logic
          }
          if (resource.isSuccess()) {
            emitState(resource);
            //TODO: Handle success with your business logic
          }
          if (resource.isException()) {
            //TODO: Handle error with your business logic
          }
        },
      );
}
