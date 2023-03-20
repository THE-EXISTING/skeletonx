import 'package:falconx/falconx.dart';

enum ScreenEvent { pop }

class ScreenEventCubit extends Cubit<BlocEvent?> {
  ScreenEventCubit() : super(null);

  BlocEvent? get data => state;

  void emitPopScreen<T>([T? result]) {
    emit(BlocEvent(name: ScreenEvent.pop, data: result));
  }

}
