import 'package:skeletonx/core/core.dart';

enum YourEvent { yourEvent }

class YourEventBloc
    extends ScreenBlocX<YourEvent, BlocEvent<YourEvent>, Resource<YourModel?>> {
  YourEventBloc({
    YourRepositories? yourRepo,
  })  : _yourRepo = yourRepo ?? YourRepositories(),
        super(Resource.init());

  final YourRepositories _yourRepo;

  @override
  Future<void> onListenEvent(BlocEvent<YourEvent> event) async {
    switch (event.name) {
      case YourEvent.yourEvent:
        break;
    }
  }

  // void _yourMethod() => fetch(
  //       key: YourEvent.yourEvent,
  //       call: _yourRepo.method(),
  //       onResource: (resource) async {
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
}
