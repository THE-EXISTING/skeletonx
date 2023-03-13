import 'package:falconx/falconx.dart';

class InitEvent<E> extends BlocEvent<E> {
  final Object? data;

  const InitEvent(
    E name, {
    Object? this.data,
  }) : super(
          name: name,
        );
}
