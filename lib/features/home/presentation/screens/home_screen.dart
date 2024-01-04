import 'package:hadrmouthamza/features/home/data/data_source/home_data_source.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeData().buildHomeUi,
    );
  }
}








