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
        borderRadius: BorderRadius.circular(
          ResponsiveValue<double>(
            context,
            defaultValue: 10,
            conditionalValues: [Condition.smallerThan(value: 5, name: DESKTOP)],
          ).value!,
        ),
      ),
      padding: EdgeInsets.all(
        ResponsiveValue<double>(
          context,
          defaultValue: 16,
          conditionalValues: [Condition.smallerThan(value: 8, name: DESKTOP)],
        ).value!,
      ),
      margin: EdgeInsets.only(
        bottom: ResponsiveValue<double>(
          context,
          defaultValue: 60,
          conditionalValues: [Condition.smallerThan(value: 30, name: DESKTOP)],
        ).value!,
      ),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.length,
            itemBuilder: (context, i) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveValue<double>(
                  context,
                  defaultValue: 16,
                  conditionalValues: [
                    Condition.smallerThan(value: 8, name: DESKTOP)
                  ],
                ).value!,
                vertical: ResponsiveValue<double>(
                  context,
                  defaultValue: 10,
                  conditionalValues: [
                    Condition.smallerThan(value: 5, name: DESKTOP)
                  ],
                ).value!,
              ),
              margin: EdgeInsets.only(
                bottom: ResponsiveValue<double>(
                  context,
                  defaultValue: 16,
                  conditionalValues: [
                    Condition.smallerThan(value: 8, name: DESKTOP)
                  ],
                ).value!,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteOp100,
                borderRadius: BorderRadius.circular(
                  ResponsiveValue<double>(
                    context,
                    defaultValue: 10,
                    conditionalValues: [
                      Condition.smallerThan(value: 5, name: DESKTOP)
                    ],
                  ).value!,
                ),
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
                            style: AppTextStyles.font16BlackSemiBold.copyWith(
                              fontSize: ResponsiveValue<double>(
                                context,
                                defaultValue: 16,
                                conditionalValues: [
                                  Condition.smallerThan(
                                      value: 12, name: DESKTOP)
                                ],
                              ).value!,
                            ),
                          ),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              childrenPadding:
                                  const EdgeInsets.only(bottom: 15),
                              expandedAlignment: Alignment.centerRight,
                              tilePadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  const Flexible(
                                    child: Text(
                                      "تفاصيل",
                                      style: AppTextStyles.font10YellowSemiBold,
                                    ),
                                  ),
                                  const Gap(5),
                                  Flexible(
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.yellowOp100,
                                      size: ResponsiveValue<double>(
                                        context,
                                        defaultValue: 20,
                                        conditionalValues: [
                                          Condition.smallerThan(
                                              value: 15, name: DESKTOP)
                                        ],
                                      ).value!,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: const SizedBox.shrink(),
                              children: [
                                Text(
                                  model[i].description ?? "",
                                  style: AppTextStyles.font16BlackOp50Medium
                                      .copyWith(
                                    fontSize: ResponsiveValue<double>(
                                      context,
                                      defaultValue: 16,
                                      conditionalValues: [
                                        Condition.smallerThan(
                                            value: 10, name: DESKTOP)
                                      ],
                                    ).value!,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      Text(
                        '${model[i].totalPrice} جنيه',
                        style: AppTextStyles.font14BlackSemiBold.copyWith(
                          fontSize: ResponsiveValue<double>(
                            context,
                            defaultValue: 14,
                            conditionalValues: [
                              Condition.smallerThan(value: 10, name: DESKTOP)
                            ],
                          ).value!,
                        ),
                      ),
                      SizedBox(
                        width: ResponsiveValue<double>(
                          context,
                          defaultValue: 20,
                          conditionalValues: [
                            Condition.smallerThan(value: 10, name: DESKTOP)
                          ],
                        ).value!,
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
                                    width: 1, color: AppColors.blackOp75),
                              ),
                              child: Image.asset(
                                Res.remove,
                                height: ResponsiveValue<double>(
                                  context,
                                  defaultValue: 15.35,
                                  conditionalValues: [
                                    Condition.smallerThan(
                                        value: 10, name: DESKTOP)
                                  ],
                                ).value!,
                                width: ResponsiveValue<double>(
                                  context,
                                  defaultValue: 12.3,
                                  conditionalValues: [
                                    Condition.smallerThan(
                                        value: 8, name: DESKTOP)
                                  ],
                                ).value!,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Center(
                            child: Text(
                              model[i].quantity.toString(),
                              style: AppTextStyles.font16BlackBold.copyWith(
                                fontSize: ResponsiveValue<double>(
                                  context,
                                  defaultValue: 16,
                                  conditionalValues: [
                                    Condition.smallerThan(
                                        value: 12, name: DESKTOP)
                                  ],
                                ).value!,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.yellowOp100,
                              borderRadius: BorderRadius.circular(
                                ResponsiveValue<double>(
                                  context,
                                  defaultValue: 5,
                                  conditionalValues: [
                                    Condition.smallerThan(
                                        value: 3, name: DESKTOP)
                                  ],
                                ).value!,
                              ),
                            ),
                            child: InkWell(
                              onTap: () => cubit.increment(model[i]),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.whiteOp100,
                                  size: ResponsiveValue<double>(
                                    context,
                                    defaultValue: 15,
                                    conditionalValues: [
                                      Condition.smallerThan(
                                          value: 10, name: DESKTOP)
                                    ],
                                  ).value!,
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
            padding: EdgeInsets.all(
              ResponsiveValue<double>(
                context,
                defaultValue: 16,
                conditionalValues: [
                  Condition.smallerThan(value: 8, name: DESKTOP)
                ],
              ).value!,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteOp100,
              borderRadius: BorderRadius.circular(
                ResponsiveValue<double>(
                  context,
                  defaultValue: 10,
                  conditionalValues: [
                    Condition.smallerThan(value: 5, name: DESKTOP)
                  ],
                ).value!,
              ),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.shadow, spreadRadius: 0, blurRadius: 12)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "سنتبع تعليماتك بافضل ما لدينا من قدرات",
                  style: AppTextStyles.font14BlackMedium.copyWith(
                    fontSize: ResponsiveValue<double>(
                      context,
                      defaultValue: 16,
                      conditionalValues: [
                        Condition.smallerThan(value: 12, name: DESKTOP)
                      ],
                    ).value!,
                  ),
                ),
                Gap(
                  ResponsiveValue<double>(
                    context,
                    defaultValue: 16,
                    conditionalValues: [
                      Condition.smallerThan(value: 10, name: DESKTOP)
                    ],
                  ).value!,
                ),
                Text(
                  "( اضافه معلومات طهي معلومات توصيل اي شي يساعدنا من وجهك نظرك لتحسن خدمتنا )",
                  style: AppTextStyles.font10BlackOp50Regular.copyWith(
                    fontSize: ResponsiveValue<double>(
                      context,
                      defaultValue: 12,
                      conditionalValues: [
                        Condition.smallerThan(value: 10, name: DESKTOP)
                      ],
                    ).value!,
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
