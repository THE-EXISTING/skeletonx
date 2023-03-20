import 'package:skeletonx/core/core.dart';

class YourPage extends AppScreen {
  const YourPage._({required Key key}) : super(key: key);

  static Widget create() => const YourPage._(key: Key('YourPage'));

  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends AppLocaleState<YourPage> {
  @override
  Widget build(BuildContext context) {
    return TodoView.create(todo: TodoFeature.authentication, appbar: true);
  }
}
