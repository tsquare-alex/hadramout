import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import 'home_item.dart';

class SpeciesSection extends StatelessWidget {
  const SpeciesSection({
    super.key,
    required this.speciesList,
    required this.section,
  });

  final SectionModel section;
  final List<SpeciesModel> speciesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              section.title,
              style: AppTextStyles.font16BlackSemiBold.copyWith(
                fontSize: ResponsiveValue<double>(context,
                    defaultValue: 22,
                    conditionalValues: [
                      Condition.smallerThan(value: 16, name: DESKTOP)
                    ]).value!,
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                context.push('${AppRoutes.sectionDetails}/${section.index}',
                    extra: section);
              },
              child: Row(
                children: [
                  Text(
                    "عرض الكل",
                    style: AppTextStyles.font10YellowSemiBold.copyWith(
                      fontSize: ResponsiveValue<double>(context,
                          defaultValue: 16,
                          conditionalValues: [
                            Condition.smallerThan(value: 10, name: DESKTOP)
                          ]).value!,
                    ),
                  ),
                  const Gap(8),
                  Image.asset(
                    ImageConstants.arrowBack,
                    width: ResponsiveValue<double>(context,
                        defaultValue: 20,
                        conditionalValues: [
                          Condition.smallerThan(value: 20 / 2, name: DESKTOP)
                        ]).value!,
                    height: ResponsiveValue<double>(context,
                        defaultValue: 20,
                        conditionalValues: [
                          Condition.smallerThan(value: 20 / 2, name: DESKTOP)
                        ]).value!,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: speciesList
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                    padding: EdgeInsets.only(
                      left: speciesList.indexOf(speciesList.last) == entry.key
                          ? 2
                          : 8,
                      right: speciesList.indexOf(speciesList.first) == entry.key
                          ? 2
                          : 8,
                    ),
                    child: HomeItem(
                      speciesItem: entry.value,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
