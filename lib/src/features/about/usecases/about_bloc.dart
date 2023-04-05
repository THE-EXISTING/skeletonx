import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/about/usecases/models/about_model.dart';

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
