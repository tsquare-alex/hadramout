import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/footer.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/explore_menu.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/species_section.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../widgets/data_dummy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeBloc.get(context).getSections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeDataError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is HomeDataSuccess) {
            return Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              thickness: 6,
              controller: context.read<HomeBloc>().pageScrollController,
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 93,
                    backgroundColor: AppColors.greyOp100,
                    pinned: true,
                    surfaceTintColor: Colors.transparent,
                    leadingWidth: 150,
                    leading: Image.asset(
                      "assets/images/home_logo.png",
                      width: 100,
                      height: 100,
                      alignment: Alignment.centerLeft,
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
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
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const ExploreMenu(),
                        ListView.builder(
                          controller:
                              context.read<HomeBloc>().pageScrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          shrinkWrap: true,
                          itemCount: HomeBloc.get(context).sections.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: SpeciesSection(
                              label:
                                  HomeBloc.get(context).sections[index].title,
                              dataList: dataList,
                            ),
                          ),
                        ),
                        // ChickenSection(),
                        // MeatSection(),
                        // KitchenSection(),
                        // GrillSection(),
                        // CasseroleSection(),
                        // SaladSection(),
                        // DrinksSection(),
                        const Footer(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
