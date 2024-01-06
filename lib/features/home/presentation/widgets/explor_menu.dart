import 'package:hadrmouthamza/features/home/presentation/widgets/custom_sections_item.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/data_dummy.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class ExplorMenu extends StatelessWidget {
  const ExplorMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "استكشاف القائمة",
            style: AppTextStyles.font24BlackSemiBold,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: sectionsNames.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.go(AppRoutes.casseroleSection);
                    },
                    child: Column(
                      children: [
                        const CutomSectionsItem(),
                        Text(
                          sectionsNames[index],
                          style: AppTextStyles.font20BlackMedium,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
