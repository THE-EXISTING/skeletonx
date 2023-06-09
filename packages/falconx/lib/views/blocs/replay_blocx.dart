import 'package:falconx/falconx.dart';

abstract class ReplayBlocX<T, Event extends BlocEvent<T>, State extends Resource>
    extends Bloc<Event, State> {
  ReplayBlocX(State initialState) : super(initialState) {
    on<Event>((event, emitter) async {
      await onListenEvent(event);
    });
  }

  final _subject = ReplaySubject<State>();
  Stream<State> get stream => _subject.stream;


  Future<void> onListenEvent(BlocEvent<T> event);

  void emitState(State newValue) => _subject.add(newValue);
}
