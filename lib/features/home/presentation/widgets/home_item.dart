import 'package:cached_network_image/cached_network_image.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/res.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../../../cart/cubit/cart_cubit.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.speciesItem,
  });

  final SpeciesModel speciesItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveValue<double>(context,
          defaultValue: 360,
          conditionalValues: [
            Condition.smallerThan(value: 267, name: DESKTOP)
          ]).value!,
      width: ResponsiveValue<double>(context,
          defaultValue: 280,
          conditionalValues: [
            Condition.smallerThan(value: 350 / 2, name: DESKTOP)
          ]).value!,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: ResponsiveValue<double>(context,
                defaultValue: 20,
                conditionalValues: [
                  Condition.smallerThan(value: 17, name: DESKTOP)
                ]).value!,
            child: Container(
              width: ResponsiveValue<double>(context,
                  defaultValue: 280,
                  conditionalValues: [
                    Condition.smallerThan(value: 347 / 2, name: DESKTOP)
                  ]).value!,
              height: ResponsiveValue<double>(context,
                  defaultValue: 290,
                  conditionalValues: [
                    Condition.smallerThan(value: 210, name: DESKTOP)
                  ]).value!,
              padding: EdgeInsets.fromLTRB(
                  ResponsiveValue<double>(context,
                      defaultValue: 16,
                      conditionalValues: [
                        Condition.smallerThan(value: 16 / 2, name: DESKTOP)
                      ]).value!,
                  0,
                  ResponsiveValue<double>(context,
                      defaultValue: 16,
                      conditionalValues: [
                        Condition.smallerThan(value: 16 / 2, name: DESKTOP)
                      ]).value!,
                  ResponsiveValue<double>(context,
                      defaultValue: 30,
                      conditionalValues: [
                        Condition.smallerThan(value: 51 / 2, name: DESKTOP)
                      ]).value!),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ResponsiveValue<double>(
                    context,
                    defaultValue: 20,
                    conditionalValues: [
                      Condition.smallerThan(value: 10, name: DESKTOP)
                    ]).value!),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.blackOp25,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          speciesItem.title,
                          maxLines: 2,
                          style: AppTextStyles.font14BlackSemiBold.copyWith(
                              fontSize: ResponsiveValue<double>(context,
                                  defaultValue: 18,
                                  conditionalValues: [
                                Condition.smallerThan(value: 14, name: DESKTOP)
                              ]).value!),
                          minFontSize: 12,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.favorite_border,
                      //     color: Colors.red,
                      //     size: 24.r,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveValue<double>(
                      context,
                      defaultValue: 4,
                      conditionalValues: [
                        Condition.smallerThan(value: 2, name: DESKTOP)
                      ],
                    ).value!,
                  ),
                  const Divider(
                    color: AppColors.blackOp10,
                  ),
                  SizedBox(
                    height: ResponsiveValue<double>(
                      context,
                      defaultValue: 4,
                      conditionalValues: [
                        Condition.smallerThan(value: 2, name: DESKTOP)
                      ],
                    ).value!,
                  ),
                  AutoSizeText(
                    speciesItem.description!,
                    maxLines: 5,
                    style: AppTextStyles.font12BlackOp50Medium.copyWith(
                        fontSize: ResponsiveValue<double>(context,
                            defaultValue: 16,
                            conditionalValues: [
                          Condition.smallerThan(value: 10, name: DESKTOP)
                        ]).value!),
                    minFontSize: 8,
                  ),
                  Gap(
                    ResponsiveValue<double>(
                      context,
                      defaultValue: 16,
                      conditionalValues: [
                        Condition.smallerThan(value: 8, name: DESKTOP)
                      ],
                    ).value!,
                  ),
                  Container(
                    height: ResponsiveValue<double>(context,
                        defaultValue: 41,
                        conditionalValues: [
                          Condition.smallerThan(value: 41 / 2, name: DESKTOP)
                        ]).value!,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: AppColors.brownOp05,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: speciesItem.offer!
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'EGP ${speciesItem.price}',
                                style: AppTextStyles.font14BlackSemiBold
                                    .copyWith(
                                        fontSize: ResponsiveValue<double>(
                                            context,
                                            defaultValue: 16,
                                            conditionalValues: [
                                      Condition.smallerThan(
                                          value: 12, name: DESKTOP)
                                    ]).value!),
                              ),
                              Text(
                                'EGP ${speciesItem.offerValue}',
                                style: AppTextStyles
                                    .font12BlackOp50SemiBoldLineThrough
                                    .copyWith(
                                  fontSize: ResponsiveValue<double>(context,
                                      defaultValue: 14,
                                      conditionalValues: [
                                        Condition.smallerThan(
                                            value: 10, name: DESKTOP)
                                      ]).value!,
                                  decorationColor: AppColors.blackOp50,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'EGP ${speciesItem.price}',
                            style: AppTextStyles.font14BlackSemiBold.copyWith(
                                fontSize: ResponsiveValue<double>(context,
                                    defaultValue: 16,
                                    conditionalValues: [
                                  Condition.smallerThan(
                                      value: 12, name: DESKTOP)
                                ]).value!),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: speciesItem.image!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: speciesItem.image!,
                    width: ResponsiveValue<double>(context,
                        defaultValue: 130,
                        conditionalValues: [
                          Condition.smallerThan(value: 80, name: DESKTOP)
                        ]).value!,
                    height: ResponsiveValue<double>(context,
                        defaultValue: 100,
                        conditionalValues: [
                          Condition.smallerThan(value: 80, name: DESKTOP)
                        ]).value!,
                    errorWidget: (context, url, error) => Image.asset(
                      Res.dashboard_logo,
                      width: ResponsiveValue<double>(context,
                          defaultValue: 130,
                          conditionalValues: [
                            Condition.smallerThan(value: 80, name: DESKTOP)
                          ]).value!,
                      height: ResponsiveValue<double>(context,
                          defaultValue: 100,
                          conditionalValues: [
                            Condition.smallerThan(value: 80, name: DESKTOP)
                          ]).value!,
                    ),
                  )
                : Image.asset(
                    Res.dashboard_logo,
                    width: ResponsiveValue<double>(context,
                        defaultValue: 130,
                        conditionalValues: [
                          Condition.smallerThan(value: 80, name: DESKTOP)
                        ]).value!,
                    height: ResponsiveValue<double>(context,
                        defaultValue: 100,
                        conditionalValues: [
                          Condition.smallerThan(value: 80, name: DESKTOP)
                        ]).value!,
                  ),
          ),
          ElevatedButton(
            style: AppButtonStyles.buttonOutlinedYellowSize188x55Rounded10
                .copyWith(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ResponsiveValue<double>(
                      context,
                      defaultValue: 10,
                      conditionalValues: [
                        Condition.smallerThan(value: 5, name: DESKTOP)
                      ]).value!),
                ),
              ),
              fixedSize: MaterialStatePropertyAll(
                Size(
                    ResponsiveValue<double>(context,
                        defaultValue: 162,
                        conditionalValues: [
                          Condition.smallerThan(value: 188 / 2, name: DESKTOP)
                        ]).value!,
                    ResponsiveValue<double>(context,
                        defaultValue: 40,
                        conditionalValues: [
                          Condition.smallerThan(value: 55 / 2, name: DESKTOP)
                        ]).value!),
              ),
            ),
            onPressed: () {
              CartBloc.get(context).addToCart(speciesItem);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.yellowOp100,
                  size: ResponsiveValue<double>(context,
                      defaultValue: 18,
                      conditionalValues: [
                        Condition.smallerThan(value: 20 / 2, name: DESKTOP)
                      ]).value!,
                ),
                SizedBox(
                  width: ResponsiveValue<double>(context,
                      defaultValue: 12,
                      conditionalValues: [
                        Condition.smallerThan(value: 12 / 2, name: DESKTOP)
                      ]).value!,
                ),
                Text(
                  "أضف إلي العربة",
                  style: AppTextStyles.font12YellowSemiBold.copyWith(
                      fontSize: ResponsiveValue<double>(context,
                          defaultValue: 14,
                          conditionalValues: [
                        Condition.smallerThan(value: 8, name: DESKTOP)
                      ]).value!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
