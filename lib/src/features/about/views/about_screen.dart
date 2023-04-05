import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/about/usecases/about_bloc.dart';
import 'package:skeletonx/src/features/about/usecases/models/about_model.dart';

class AboutScreen extends AppScreen {
  const AboutScreen._({required Key key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (context) => AboutBloc()..addInitEvent(AboutEvent.init),
      child: const AboutScreen._(
        key: Key('AboutScreen'),
      ),
    );
  }

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends AppScreenLocaleScaffoldBlocState<AboutScreen,
    AboutBloc, Resource<AboutModel?>> {
  @override
  PreferredSizeWidget? buildAppBar(Resource<AboutModel?> state) {
    return AppToolbar(title: 'About');
  }

  @override
  Widget buildBody(BuildContext context, Resource<AboutModel?> state) {
    return Center(
      child: Text('About'),
    );
  }
}
