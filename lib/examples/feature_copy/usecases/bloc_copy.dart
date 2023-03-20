import 'package:skeletonx/core/core.dart';

enum YourEvent { yourEvent }

class YourEventBloc extends ScreenBlocX<YourEvent, BlocEvent<YourEvent>,
    Resource<YourModel?>> {
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
  //       onData: emitState,
  //       onError: (exception, stackTrace) {
  //         //TODO: Handle error to show modal
  //         // emitState(Resource.createEvent(AuthenPageEvent.showErrorSignIn));
  //       },
  //     );
}
