import 'package:skeletonx/core/core.dart';

class YourTodoScreen extends AppScreen {
  const YourTodoScreen._({required Key key}) : super(key: key);

  static Widget create() => const YourTodoScreen._(key: Key('YourPage'));

  @override
  State<YourTodoScreen> createState() => _YourPageState();
}

class _YourPageState extends AppLocaleState<YourTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return TodoView.create(todo: TodoFeature.authentication, appbar: true);
  }
}
