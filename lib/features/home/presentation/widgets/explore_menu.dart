import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/custom_sections_item.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class ExploreMenu extends StatelessWidget {
  const ExploreMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValue<double>(context,
              defaultValue: 40,
              conditionalValues: [
                Condition.smallerThan(value: 40 / 2, name: DESKTOP)
              ]).value!,
          vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "استكشاف القائمة",
            style: AppTextStyles.font16BlackSemiBold.copyWith(
                fontSize: ResponsiveValue<double>(context,
                    defaultValue: 22,
                    conditionalValues: [
                  Condition.smallerThan(value: 16, name: DESKTOP)
                ]).value!),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: ResponsiveValue<double>(context,
                defaultValue: 220,
                conditionalValues: [
                  Condition.smallerThan(value: 130, name: DESKTOP)
                ]).value!,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: context.read<HomeBloc>().sections.length,
              itemBuilder: (context, index) {
                final section = context.read<HomeBloc>().sections[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: context.read<HomeBloc>().sections.indexOf(
                                context.read<HomeBloc>().sections.last) ==
                            index
                        ? 2
                        : 8,
                    right: context.read<HomeBloc>().sections.indexOf(
                                context.read<HomeBloc>().sections.first) ==
                            index
                        ? 2
                        : 8,
                  ),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      context.push(
                        '${AppRoutes.sectionDetails}/${section.index}',
                        extra: section,
                      );
                    },
                    child: CustomSectionsItem(section: section),
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
