import 'package:falconx/falconx.dart';

class ObjectEvent<E> extends BlocEvent<E> {
  final Object? data;

  const ObjectEvent(E name,{
    Object? this.data,
  }) : super(name: name);
}
