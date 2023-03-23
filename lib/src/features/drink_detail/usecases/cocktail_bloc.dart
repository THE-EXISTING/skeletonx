import 'package:skeletonx/core/core.dart';

enum CocktailEvent {
  loadDrink,
}

enum ViewEvent {
  loading,
}

class CocktailBloc extends ScreenBlocX<CocktailEvent, BlocEvent<CocktailEvent>,
    Resource<DrinkModel?>> {
  CocktailBloc({
    required this.id,
    DrinkRepository? cocktailRepo,
  })  : _cocktailRepo = cocktailRepo ?? DrinkRepository(),
        super(Resource.init());

  final String id;
  final DrinkRepository _cocktailRepo;

  @override
  Future<void> onListenEvent(BlocEvent<CocktailEvent> event) async {
    switch (event.name) {
      case CocktailEvent.loadDrink:
        _fetchDrink();
        break;
    }
  }

  ///========================= PRIVATE METHOD =========================///

  void _fetchDrink() => fetch(
        key: CocktailEvent.loadDrink,
        call: _cocktailRepo.getDrinkById(id: id),
        onResource: (resource) {
          if (resource.isLoading()) {
            screenEventCubit
                .emit(const BlocEvent(name: ViewEvent.loading, data: true));

            //TODO: Handle loading with your business logic
          }
          if (resource.isSuccess()) {
            Future.delayed(const Duration(seconds: 1), () {
              screenEventCubit
                  .emit(const BlocEvent(name: ViewEvent.loading, data: false));

              emitState(resource);
            });

            //TODO: Handle success with your business logic
          }
          if (resource.isException()) {
            //TODO: Handle error with your business logic
          }
        },
      );
}
