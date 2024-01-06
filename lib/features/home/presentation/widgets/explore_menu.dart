import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/custom_sections_item.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class ExploreMenu extends StatelessWidget {
  const ExploreMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 32),
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
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: context.read<HomeBloc>().sections.length,
              itemBuilder: (context, index) {
                String title = context.read<HomeBloc>().sections[index].title;
                return Padding(
                  padding: EdgeInsets.only(
                    left: context.read<HomeBloc>().sections.indexOf(
                                context.read<HomeBloc>().sections.last) ==
                            index
                        ? 0
                        : 10,
                    right: context.read<HomeBloc>().sections.indexOf(
                                context.read<HomeBloc>().sections.first) ==
                            index
                        ? 0
                        : 10,
                  ),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      context.go("${AppRoutes.sectionDetails}/$title");
                    },
                    child: CustomSectionsItem(title: title),
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
