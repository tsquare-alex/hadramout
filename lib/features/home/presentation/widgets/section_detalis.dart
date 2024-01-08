import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/footer.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/home_item.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/loading_circle.dart';

class SectionDetails extends StatefulWidget {
  const SectionDetails({
    super.key,
    required this.section,
  });

  final SectionModel section;

  @override
  State<SectionDetails> createState() => _SectionDetailsState();
}

class _SectionDetailsState extends State<SectionDetails> {
  @override
  void initState() {
    HomeBloc.get(context).getAllSpecies(widget.section);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is SectionDetailsLoading) {
            return const Center(
              child: SizedBox.square(
                dimension: 50,
                child: LoadingSpinningCircle(
                  color: AppColors.yellowOp100,
                ),
              ),
            );
          } else if (state is SectionDetailsError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is SectionDetailsSuccess) {
            return Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              interactive: true,
              thickness: 6,
              controller:
                  context.read<HomeBloc>().sectionDetailsScrollController,
              child: CustomScrollView(
                controller:
                    context.read<HomeBloc>().sectionDetailsScrollController,
                shrinkWrap: true,
                slivers: [
                  const CustomAppBar(),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Text(
                            widget.section.title,
                            style: AppTextStyles.font24BlackSemiBold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60,
                          ),
                          child: SingleChildScrollView(
                            child: Wrap(
                              children: [
                                ...HomeBloc.get(context).species.map(
                                    (speciesItem) =>
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: HomeItem(speciesItem: speciesItem),
                                        )),
                              ],
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
