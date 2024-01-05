import 'package:hadrmouthamza/features/home/presentation/widgets/casserole_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/chicken_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/container_footer.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/drinks_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/grill_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/kitchen_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/meat_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/salad_section.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
              child: ListView(
            children: const [
              ChickenSection(),
              MeatSection(),
              KitchenSection(),
              GrillSection(),
              CasseroleSection(),
              SaladSection(),
              DrinksSection(),
              Footer(),
            ],
          )),
        ],
      ),
    );
  }
}
