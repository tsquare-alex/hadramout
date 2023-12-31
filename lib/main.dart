import 'package:url_strategy/url_strategy.dart';

import 'package:hadrmouthamza/core/helpers/app_bloc_observer.dart';
import 'package:hadrmouthamza/src/app.dart';
import 'package:hadrmouthamza/src/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initGetIt();
  setPathUrlStrategy();
  Bloc.observer = AppBlocObserver();

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((value) {
    runApp(const MyApp());
  });
}
