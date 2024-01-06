import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/custom_sections_item.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class ExplorMenu extends StatefulWidget {
  const ExplorMenu({super.key});

  @override
  State<ExplorMenu> createState() => _ExplorMenuState();
}

class _ExplorMenuState extends State<ExplorMenu> {
  @override
  void initState() {
    context.read<HomeBloc>().getSections();
    super.initState();
  }

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
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeDataLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeDataError) {
                  return const Center(
                    child: Text(""),
                  );
                } else if (state is HomeDataSuccess) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: context.read<HomeBloc>().sections.length,
                      itemBuilder: (context, index) {
                        String title =
                            context.read<HomeBloc>().sections[index].title;
                        return InkWell(
                          onTap: () {
                            context.go("${AppRoutes.sectionDetalis}/$title");
                          },
                          child: Column(
                            children: [
                              const CutomSectionsItem(),
                              Text(
                                context.read<HomeBloc>().sections[index].title,
                                style: AppTextStyles.font20BlackMedium,
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return const Text("""""data""" "");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
