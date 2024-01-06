import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/casserole_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/chicken_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/container_footer.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/drinks_section.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/explor_menu.dart';
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
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        interactive: true,
        thickness: 6,
        controller: context.read<HomeBloc>().pageScrollController,
        child: CustomScrollView(
          controller: context.read<HomeBloc>().pageScrollController,
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              toolbarHeight: 93,
              backgroundColor: AppColors.greyOp100,
              pinned: true,
              surfaceTintColor: Colors.transparent,
              leadingWidth: 100,
              leading: Image.asset(
                "assets/images/home_logo.png",
                width: 100,
                height: 100,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: 15.r),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Tooltip(
                      message: 'عربة التسوق',
                      decoration: BoxDecoration(
                        color: AppColors.yellowOp100,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 32,
                            height: 30,
                            child: Image.asset(
                              ImageConstants.cart,
                              color: AppColors.yellowOp100,
                              width: 26,
                              height: 24,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 21,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellowOp100,
                              ),
                              child: const Center(
                                child: Text(
                                  "0",
                                  style: AppTextStyles.font12WhiteBold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  ExplorMenu(),
                  ChickenSection(),
                  MeatSection(),
                  KitchenSection(),
                  GrillSection(),
                  CasseroleSection(),
                  SaladSection(),
                  DrinksSection(),
                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Scaffold(

    // );
  }
}
