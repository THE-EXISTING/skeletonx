import 'package:skeletonx/core/core.dart';

import '../home.dart';

enum HomeEvent { loadHomePage, getAlcoholic, getNonAlcoholic }

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
        _getAlcoholic();
        _getNonAlcoholic();
        break;
      case HomeEvent.getAlcoholic:
        _getAlcoholic();
        break;
      case HomeEvent.getNonAlcoholic:
        _getNonAlcoholic();
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
          }
          if (resource.isSuccess()) {
            emitEvent(HomeEvent.loadHomePage);
            emitState(resource);
          }
          if (resource.isException()) {
            //TODO: Handle error with your business logic
          }
        },
      );

  void _getAlcoholic() => fetch(
        key: HomeEvent.getAlcoholic,
        call: _cocktailRepo.filterByAlcoholic(isAlcoholic: true),
        onResource: (resource) {
          if (resource.isLoading()) {
            emitState(resource);
          }
          if (resource.isSuccess()) {
            emitEvent(HomeEvent.getAlcoholic);
            emitState(resource);
          }
          if (resource.isException()) {
            //TODO: Handle error with your business logic
          }
        },
      );

  void _getNonAlcoholic() => fetch(
        key: HomeEvent.getNonAlcoholic,
        call: _cocktailRepo.filterByAlcoholic(isAlcoholic: false),
        onResource: (resource) {
          if (resource.isLoading()) {
            emitState(resource);
          }
          if (resource.isSuccess()) {
            emitEvent(HomeEvent.getNonAlcoholic);
            emitState(resource);
          }
          if (resource.isException()) {
            //TODO: Handle error with your business logic
          }
        },
      );
}
