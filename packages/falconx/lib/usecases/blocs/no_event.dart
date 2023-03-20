import 'package:falconx/falconx.dart';

class NoEvent{}

class NoEventBloc extends BlocEvent<NoEvent>{
  NoEventBloc() : super(name: NoEvent(), data: null);
}
