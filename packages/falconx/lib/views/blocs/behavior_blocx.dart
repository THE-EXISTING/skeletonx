import 'package:falconx/falconx.dart';

abstract class BehaviorBlocX<E, Event extends BlocEvent<E>, State>
    extends BaseBloc<State> {
  BehaviorBlocX(State initialState)
      : _state = initialState,
        super(initialState) {
    on<Event>((event, emitter) async {
      await onListenEvent(event);
    });
  }

  State _state;
  final _subject = BehaviorSubject<State>();

  @override
  Stream<State> get stream => _subject.stream;

  @override
  State get state => _state;

  Future<void> onListenEvent(BlocEvent<E> event);

  void addInitEvent(E event) {
    add(InitEvent(event) as Event);
  }

  void addAppEvent<T>(E event, {T? data}) {
    add(ObjectEvent(event, data: data) as Event);
  }

  void addUserTabEvent<T>(E event, {T? data}) {
    add(ClickEvent(event, data: data) as Event);
  }

  void addUserTypingEvent<T>(E event, {required T data}) {
    add(TypingEvent(event, data: data) as Event);
  }

  void emitState(State newState) {
    if (_subject.isClosed) return;
    _subject.add(newState);
    _state = newState;
  }

  @override
  void emitResourceSuccessState<T>(T newValue) =>
      _subject.add(Resource.success(data: newValue) as State);
}
