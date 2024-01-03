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
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
                child: ListView(
              children: [
                const Text(
                  "قسم الدجاج",
                  style: AppTextStyles.font24BlackSemiBold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const ChickenSection(),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "قسم اللحوم",
                  style: AppTextStyles.font24BlackSemiBold,
                ),
                SizedBox(height: 10.h),
                const MeatSection(),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "قسم المطبخ ",
                  style: AppTextStyles.font24BlackSemiBold,
                ),
                SizedBox(height: 10.h),
                const KitchenSection(),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "قسم المشويات",
                  style: AppTextStyles.font24BlackSemiBold,
                ),
                SizedBox(height: 10.h),
                const GrillSection(),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "قسم الطواجن",
                  style: AppTextStyles.font24BlackSemiBold,
                ),
                SizedBox(height: 10.h),
                const CasseroleSection(),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "قسم السلطات",
                  style: AppTextStyles.font24BlackSemiBold,
                ),
                SizedBox(height: 10.h),
                const SaladSection(),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "قسم المشروبات",
                  style: AppTextStyles.font24BlackSemiBold,
                ),
                SizedBox(height: 10.h),
                const DrinksSection(),
                const SizedBox(
                  height: 20,
                ),
                const Footer(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
