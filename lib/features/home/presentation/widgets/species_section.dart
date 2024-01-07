import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import 'data_dummy.dart';
import 'home_item.dart';

class SpeciesSection extends StatelessWidget {
  const SpeciesSection({
    super.key,
    required this.label,
    required this.speciesList,
  });

  final String label;
  final List<SpeciesModel> speciesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppTextStyles.font24BlackSemiBold,
              ),
              const Gap(16),
              InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.push(AppRoutes.sectionDetails, extra: label);
                },
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "عرض الكل",
                          style: AppTextStyles.font16YellowSemiBold,
                        ),
                        const Gap(8),
                        Image.asset(ImageConstants.arrowBack),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(20),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: speciesList.length,
              itemBuilder: (context, index) {
                final speciesItem = speciesList[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: dataList.indexOf(dataList.last) == index ? 0 : 16,
                    right: dataList.indexOf(dataList.first) == index ? 0 : 16,
                  ),
                  child: HomeItem(
                    speciesItem: speciesItem,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
