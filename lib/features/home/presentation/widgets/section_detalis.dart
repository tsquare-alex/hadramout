import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/home_item_list.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class SectionDetails extends StatelessWidget {
  final String sectionName;

  const SectionDetails({
    super.key,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              "قسم {${context.read<HomeBloc>().sectionsNames}",
              style: AppTextStyles.font24BlackSemiBold,
            ),
          ),
          Expanded(
            child: Padding(
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
                        child: HomeItemList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
