import 'package:skeletonx/core/core.dart';

import '../data/data.dart';

enum HomeEvent {
  loadHomePage
}

class HomeBloc extends ScreenBlocX<HomeEvent, BlocEvent<HomeEvent>,
    Resource<List<HomeDrinkModel?>>> {
  HomeBloc({
    HomeRepository? cocktailRepo,
  })  : _cocktailRepo = cocktailRepo ?? HomeRepository(),
        super(Resource.init());

  final HomeRepository _cocktailRepo;

  @override
  Future<void> onListenEvent(BlocEvent<HomeEvent> event) async {
    switch (event.name) {
      case HomeEvent.loadHomePage:
        _fetchDrink();
        break;
    }
  }

  ///========================= PRIVATE METHOD =========================///
  void _fetchDrink() => fetch(
    key: HomeEvent.loadHomePage,
    call: _cocktailRepo.get4RandomDrink(),
    onResource: (resource) {
      if (resource.isLoading()) {
        emitState(resource);

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
