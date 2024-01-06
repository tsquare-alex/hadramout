import 'package:hadrmouthamza/features/home/presentation/widgets/home_item_list.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class SaladSection extends StatelessWidget {
  const SaladSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String title = "قسم السلطات";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "قسم السلطات",
                style: AppTextStyles.font24BlackSemiBold,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.go("${AppRoutes.sectionDetalis}/$title");
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
            height: 15,
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
