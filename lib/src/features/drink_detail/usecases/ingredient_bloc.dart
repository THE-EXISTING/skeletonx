import 'package:skeletonx/core/core.dart';

enum IngredientEvent {
  init,
}

class IngredientBloc extends ScreenBlocX<IngredientEvent,
    BlocEvent<IngredientEvent>, Resource<IngredientModel?>> {
  IngredientBloc({
    required this.ingredient,
    DrinkRepository? cocktailRepo,
  }) : super(Resource.init());

  final IngredientModel ingredient;

  @override
  Future<void> onListenEvent(BlocEvent<IngredientEvent> event) async {
    switch (event.name) {
      case IngredientEvent.init:
        emitResourceSuccessState(ingredient);
        break;
    }
  }

  ///========================= PRIVATE METHOD =========================///
}
