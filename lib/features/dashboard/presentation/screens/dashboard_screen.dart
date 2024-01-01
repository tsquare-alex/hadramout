import 'package:hadrmouthamza/core/themes/styles.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConstants.dashboardLogo,
                            height: 50,
                            width: 50,
                          ),
                          ResponsiveVisibility(
                            hiddenConditions: [
                              Condition.smallerThan(value: false, name: DESKTOP)
                            ],
                            child: const SizedBox(
                              width: 12,
                            ),
                          ),
                          ResponsiveVisibility(
                            hiddenConditions: [
                              Condition.smallerThan(value: false, name: DESKTOP)
                            ],
                            child: const Text(
                              'حضرموت حمزة',
                              style: AppTextStyles.font20BrownBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    style: ListTileStyle.drawer,
                    selected: true,
                    title: const Text(
                      'الرئيسية',
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    selectedColor: AppColors.whiteOp100,
                    selectedTileColor: AppColors.yellowOp100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      // HomeBloc.get(context).changeIndex(index);
                      // HomeBloc.get(context).changeRoute(context);
                    },
                  ),
                  ListTile(
                    style: ListTileStyle.drawer,
                    selected: false,
                    title: const Text(
                      'الرئيسية',
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    selectedColor: AppColors.whiteOp100,
                    selectedTileColor: AppColors.yellowOp100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      // HomeBloc.get(context).changeIndex(index);
                      // HomeBloc.get(context).changeRoute(context);
                    },
                  ),
                  ListTile(
                    style: ListTileStyle.drawer,
                    selected: false,
                    title: const Text(
                      'الرئيسية',
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    selectedColor: AppColors.whiteOp100,
                    selectedTileColor: AppColors.yellowOp100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      // HomeBloc.get(context).changeIndex(index);
                      // HomeBloc.get(context).changeRoute(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 93,
                  backgroundColor: AppColors.greyOp100,
                  pinned: true,
                  surfaceTintColor: Colors.transparent,
                  leadingWidth: ResponsiveValue<double>(
                    context,
                    conditionalValues: [
                      Condition.smallerThan(value: 80, name: TABLET),
                    ],
                    defaultValue: 235,
                  ).value,
                  title: Text(
                    'الاطباق',
                    style: AppTextStyles.font20BlackSemiBold.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  actions: const [
                    Icon(Icons.search),
                    SizedBox(width: 20),
                    Icon(Icons.search),
                    SizedBox(width: 20),
                    Icon(Icons.search),
                    SizedBox(width: 20),
                    Icon(Icons.search),
                    SizedBox(width: 20),
                  ],
                ),
                SliverFillRemaining(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: AppColors.whiteOp100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
