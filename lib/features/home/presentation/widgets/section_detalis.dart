import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/home_item.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SectionDetails extends StatelessWidget {
  final String title;

  const SectionDetails({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        interactive: true,
        thickness: 6,
        controller: context.read<HomeBloc>().sectionDetailsScrollController,
        child: CustomScrollView(
          controller: context.read<HomeBloc>().sectionDetailsScrollController,
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
                      title,
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
                          ...List.generate(
                            20,
                            (index) => const Padding(
                              padding: EdgeInsets.all(28),
                              child: HomeItem(),
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
        ),
      ),
    );
  }
}
