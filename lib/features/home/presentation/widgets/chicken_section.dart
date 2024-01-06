import 'package:hadrmouthamza/features/home/presentation/widgets/home_item_list.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class ChickenSection extends StatelessWidget {
  const ChickenSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "قسم الدجاج",
                style: AppTextStyles.font24BlackSemiBold,
              ),
              InkWell(
                onTap: () {
                  context.go(AppRoutes.chickenSection);
                },
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "عرض الكل",
                          style: AppTextStyles.font16YellowSemiBold,
                        ),
                        Image.asset(ImageConstants.arrowBack),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 380,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const HomeItemList();
                }),
          ),
        ],
      ),
    );
  }
}
