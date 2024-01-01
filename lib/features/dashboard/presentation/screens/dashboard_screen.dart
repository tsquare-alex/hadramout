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
      backgroundColor: AppColors.whiteOp100,
      body: CustomScrollView(
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
            leading: Padding(
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
                        Condition.smallerThan(value: false, name: TABLET)
                      ],
                      child: const SizedBox(
                        width: 12,
                      ),
                    ),
                    ResponsiveVisibility(
                      hiddenConditions: [
                        Condition.smallerThan(value: false, name: TABLET)
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
          ),
          const SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: ColoredBox(
                    color: AppColors.greyOp100,
                    child: SizedBox(
                      height: 930,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
