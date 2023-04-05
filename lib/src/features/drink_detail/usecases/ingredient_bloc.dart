import 'package:skeletonx/core/core.dart';

enum IngredientEvent {
  loadIngredient,
}

class IngredientBloc extends ScreenBlocX<IngredientEvent,
    BlocEvent<IngredientEvent>, Resource<IngredientModel?>> {
  IngredientBloc({
    required this.name,
    DrinkRepository? cocktailRepo,
  })  : _cocktailRepo = cocktailRepo ?? DrinkRepository(),
        super(Resource.init());

  final String name;
  final DrinkRepository _cocktailRepo;

  @override
  Future<void> onListenEvent(BlocEvent<IngredientEvent> event) async {
    switch (event.name) {
      case IngredientEvent.loadIngredient:
        _fetchIngredient();
        break;
    }
  }

  ///========================= PRIVATE METHOD =========================///

  void _fetchIngredient() => fetch(
        key: IngredientEvent.loadIngredient,
        call: _cocktailRepo.searchIngredientByName(name: name),
        onResource: (resource) {
          if (resource.isLoading()) {
            emitState(resource);
          }
          if (resource.isSuccess()) {
            emitState(resource);
          }
          if (resource.isException()) {}
        },
      );
}
