import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/explore_menu.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/footer.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/species_section.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/loading_circle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeBloc.get(context).getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 25,
        child: Tooltip(
          message: 'راسلنا عالواتساب',
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => context.read<HomeBloc>().openWhatsapp(),
            child: const FaIcon(
              FontAwesomeIcons.whatsapp,
              size: 30,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          return (previous == HomeDataLoading() ||
              current == HomeDataSuccess());
        },
        builder: (context, state) {
          if (state is HomeDataLoading) {
            return const Center(
              child: SizedBox.square(
                dimension: 50,
                child: LoadingSpinningCircle(
                  color: AppColors.yellowOp100,
                ),
              ),
            );
          } else if (state is HomeDataError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is HomeDataSuccess) {
            return CustomScrollView(
              slivers: [
                const CustomAppBar(appBarColor: AppColors.whiteOp100),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const ExploreMenu(),
                      ListView.builder(
                        controller:
                            context.read<HomeBloc>().homePageScrollController,
                        padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveValue<double>(context,
                                defaultValue: 40,
                                conditionalValues: [
                                  Condition.smallerThan(
                                      value: 40 / 2, name: DESKTOP)
                                ]).value!,
                            vertical: 20),
                        shrinkWrap: true,
                        itemCount: HomeBloc.get(context).sections.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.r),
                          child: SpeciesSection(
                            section: HomeBloc.get(context).sections[index],
                            speciesList: HomeBloc.get(context)
                                .homeSpecies
                                .where((element) =>
                                    element.section.title ==
                                    HomeBloc.get(context).sections[index].title)
                                .toList(),
                          ),
                        ),
                      ),
                      const Footer(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
