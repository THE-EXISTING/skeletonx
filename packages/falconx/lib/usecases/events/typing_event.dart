import 'package:falconx/falconx.dart';

class TypingEvent<Event, T> extends BlocEvent<Event> {
  final T? data;

  const TypingEvent(
    Event name, {
    required this.data,
  }) : super(name: name);
}
