import 'package:skeletonx/core/core.dart';

enum CocktailEvent { loadDrink, loadSearchByName }

class CocktailBloc extends ScreenBlocX<CocktailEvent, BlocEvent<CocktailEvent>,
    Resource<List<DrinkModel>>> {
  CocktailBloc({
    required this.id,
    required this.name,
    DrinkRepository? cocktailRepo,
  })  : _cocktailRepo = cocktailRepo ?? DrinkRepository(),
        super(Resource.init());

  final String id;
  final String name;
  final DrinkRepository _cocktailRepo;

  @override
  Future<void> onListenEvent(BlocEvent<CocktailEvent> event) async {
    switch (event.name) {
      case CocktailEvent.loadDrink:
        // _fetchDrink();
        break;
      case CocktailEvent.loadSearchByName:
        _fetchFilterDrink();
        break;
    }
  }

  ///========================= PRIVATE METHOD =========================///
  // void _fetchDrink() => fetch(
  //       key: CocktailEvent.loadDrink,
  //       call: _cocktailRepo.getDrinkById(id: id),
  //       onResource: (resource) {
  //         if (resource.isLoading()) {
  //           //TODO: Handle loading with your business logic
  //         }
  //         if (resource.isSuccess()) {
  //           emitState(resource);
  //           //TODO: Handle success with your business logic
  //         }
  //         if (resource.isException()) {
  //           //TODO: Handle error with your business logic
  //         }
  //       },
  //     );

  void _fetchFilterDrink() => fetch(
      key: CocktailEvent.loadSearchByName,
      call: _cocktailRepo.searchDrinkByName(name: name),
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
