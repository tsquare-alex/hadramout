import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
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
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                const CustomAppBar(
                  appBarColor: AppColors.whiteOp100,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ResponsiveValue<double>(context,
                                defaultValue: 30,
                                conditionalValues: [
                                  Condition.smallerThan(
                                      value: 30 / 2, name: DESKTOP)
                                ]).value!,
                            horizontal: ResponsiveValue<double>(context,
                                defaultValue: 60,
                                conditionalValues: [
                                  Condition.smallerThan(
                                      value: 60 / 2, name: DESKTOP)
                                ]).value!),
                        child: Text(
                          widget.section.title,
                          style: AppTextStyles.font16BlackSemiBold.copyWith(
                            fontSize: ResponsiveValue<double>(context,
                                defaultValue: 24,
                                conditionalValues: [
                                  Condition.smallerThan(
                                      value: 16, name: DESKTOP)
                                ]).value!,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ResponsiveValue<double>(context,
                            defaultValue: 40,
                            conditionalValues: [
                              Condition.smallerThan(
                                  value: 40 / 2, name: DESKTOP)
                            ]).value!),
                        child: SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ...HomeBloc.get(context).species.map(
                                    (speciesItem) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: ResponsiveValue<double>(
                                              context,
                                              defaultValue: 16,
                                              conditionalValues: [
                                                Condition.smallerThan(
                                                    value: 8, name: DESKTOP)
                                              ]).value!),
                                      child: HomeItem(speciesItem: speciesItem),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ),
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
