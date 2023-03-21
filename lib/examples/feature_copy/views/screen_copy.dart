import 'package:skeletonx/core/core.dart';

class YourScreen extends AppScreen {
  const YourScreen._({required Key key}) : super(key: key);

  static Widget create() =>
      const YourScreen._(key: Key('YourPage'));

  @override
  State<YourScreen> createState() =>
      _YourPageState();
}

class _YourPageState
    extends AppLocaleState<YourScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
