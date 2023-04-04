import 'package:skeletonx/core/core.dart';

enum IngredientEvent {
  init,
}

class IngredientBloc extends ScreenBlocX<IngredientEvent,
    BlocEvent<IngredientEvent>, Resource<IngredientModel?>> {
  IngredientBloc({
    required this.name,
    DrinkRepository? cocktailRepo,
  }) : super(Resource.init());

  final String name;

  @override
  Future<void> onListenEvent(BlocEvent<IngredientEvent> event) async {
    switch (event.name) {
      case IngredientEvent.init:
        emitResourceSuccessState(
          IngredientModel(
              id: '', name: name, description: 'desc', isAlcohol: false),
        );
        break;
    }
  }

  ///========================= PRIVATE METHOD =========================///
}
