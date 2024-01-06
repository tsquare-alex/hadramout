import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/explore_menu.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/footer.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/species_section.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/loading_circle.dart';
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
            return Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              thickness: 6,
              controller: context.read<HomeBloc>().pageScrollController,
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  const CustomAppBar(),
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
