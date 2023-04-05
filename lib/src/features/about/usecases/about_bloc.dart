import 'package:skeletonx/core/core.dart';

enum AboutEvent {
  init,
}

class AboutBloc extends ScreenBlocX<AboutEvent, BlocEvent<AboutEvent>,
    Resource<AboutModel?>> {
  AboutBloc() : super(Resource.init());

  @override
  Future<void> onListenEvent(BlocEvent<AboutEvent> event) async {
    switch (event.name) {
      case AboutEvent.init:
        break;
    }
  }
}
