import 'package:cached_network_image/cached_network_image.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/models/cart.dart';
import 'package:hadrmouthamza/res.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartItems extends StatelessWidget {
  const BuildCartItems({super.key, required this.model, required this.cubit});
  final List<CartModel> model;
  final CartBloc cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyOp100,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 60.0),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.length,
            itemBuilder: (context, i) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteOp100,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.shadow, spreadRadius: 0, blurRadius: 12)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  model[i].image!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: model[i].image!,
                          height: 60,
                          width: 60,
                          errorWidget: (context, url, error) =>
                              const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              Res.home_logo,
                            ),
                          ),
                        )
                      : const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            Res.home_logo,
                          ),
                        ),
                  const Gap(15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model[i].title,
                            style: AppTextStyles.font16BlackSemiBold,
                          ),
                          SizedBox(
                            width: 250,
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                childrenPadding: const EdgeInsets.all(5),
                                tilePadding: EdgeInsets.zero,
                                title: const Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "تفاصيل",
                                        style:
                                            AppTextStyles.font10YellowSemiBold,
                                      ),
                                    ),
                                    Gap(5),
                                    Flexible(
                                        child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.yellowOp100,
                                      size: 20,
                                    ))
                                  ],
                                ),
                                trailing: const SizedBox.shrink(),
                                children: [
                                  Text(
                                    model[i].description ?? "",
                                    style: AppTextStyles.font16BlackOp50Medium,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "EGP",
                            style: AppTextStyles.font14BlackSemiBold,
                          ),
                          const Gap(5),
                          Text(
                            '${model[i].totalPrice}',
                            style: AppTextStyles.font14BlackSemiBold,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => cubit.decrement(model[i], i),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteOp100,
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                      width: 1, color: AppColors.blackOp75)),
                              child: Image.asset(
                                Res.remove,
                                height: 15.35,
                                width: 12.3,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Center(
                            child: Text(
                              model[i].quantity.toString(),
                              style: AppTextStyles.font16BlackBold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.yellowOp100,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: InkWell(
                              onTap: () => cubit.increment(model[i]),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.whiteOp100,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.whiteOp100,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.shadow, spreadRadius: 0, blurRadius: 12)
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "سنتبع تعليماتك بافضل ما لدينا من قدرات",
                  style: AppTextStyles.font14BlackMedium,
                ),
                Gap(16),
                Text(
                  "( اضافه معلومات طهي معلومات توصيل اي شي يساعدنا من وجهك نظرك لتحسن خدمتنا )",
                  style: AppTextStyles.font10BlackOp50Regular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
