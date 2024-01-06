import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/home_item.dart';
import 'package:hadrmouthamza/src/app_export.dart';

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
        controller: context.read<HomeBloc>().pageScrollController,
        child: CustomScrollView(
          controller: context.read<HomeBloc>().pageScrollController,
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              toolbarHeight: 93,
              backgroundColor: AppColors.greyOp100,
              pinned: true,
              surfaceTintColor: Colors.transparent,
              leadingWidth: 100,
              leading: Image.asset(
                "assets/images/home_logo.png",
                width: 100,
                height: 100,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: 15.r),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Tooltip(
                      message: 'عربة التسوق',
                      decoration: BoxDecoration(
                        color: AppColors.yellowOp100,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 32,
                            height: 30,
                            child: Image.asset(
                              ImageConstants.cart,
                              color: AppColors.yellowOp100,
                              width: 26,
                              height: 24,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 21,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellowOp100,
                              ),
                              child: const Center(
                                child: Text(
                                  "0",
                                  style: AppTextStyles.font12WhiteBold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
