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
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(children: [
        const CustomAppBar(),
        const Text(
          "قسم الدجاج",
          style: AppTextStyles.font24BlackSemiBold,
        ),
        SizedBox(
          height: 10.h,
        ),
        const ChickenSection(),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          "قسم اللحوم",
          style: AppTextStyles.font24BlackSemiBold,
        ),
        const MeatSection(),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          "قسم المطبخ ",
          style: AppTextStyles.font24BlackSemiBold,
        ),
        const KitchenSection(),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          "قسم المشويات",
          style: AppTextStyles.font24BlackSemiBold,
        ),
        const GrillSection(),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          "قسم الطواجن",
          style: AppTextStyles.font24BlackSemiBold,
        ),
        const CasseroleSection(),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          "قسم السلطات",
          style: AppTextStyles.font24BlackSemiBold,
        ),
        const SaladSection(),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          "قسم المشروبات",
          style: AppTextStyles.font24BlackSemiBold,
        ),
        const DrinksSection(),
        const SizedBox(
          height: 10,
        ),
        const Footer(),
      ]),
    ));
  }
}
