import 'package:hadrmouthamza/res.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartNoData extends StatelessWidget {
  const BuildCartNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: MediaQuery.of(context).size.width * 0.10,
      ),
      height: 507,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Res.cartNoItem,
            width: ResponsiveValue<double>(context,
                defaultValue: 200,
                conditionalValues: [
                  Condition.smallerThan(value: 200 / 2, name: DESKTOP)
                ]).value!,
            height: ResponsiveValue<double>(context,
                defaultValue: 171,
                conditionalValues: [
                  Condition.smallerThan(value: 171 / 2, name: DESKTOP)
                ]).value!,
          ),
          const Gap(
            16,
          ),
          Text(
            "عربة التسوق فارغة",
            style: AppTextStyles.font24BlackSemiBold.copyWith(
              fontSize: ResponsiveValue<double>(
                context,
                defaultValue: 22,
                conditionalValues: [
                  Condition.smallerThan(value: 18, name: DESKTOP)
                ],
              ).value!,
            ),
          ),
          const Gap(
            16,
          ),
          Text(
            "الرجاء اضافة بعض العناصر من القائمة",
            style: AppTextStyles.font20BlackRegular.copyWith(
              fontSize: ResponsiveValue<double>(
                context,
                defaultValue: 18,
                conditionalValues: [
                  Condition.smallerThan(value: 14, name: DESKTOP)
                ],
              ).value!,
            ),
          ),
          const Gap(
            16,
          ),
          ElevatedButton(
            onPressed: () {
              Router.neglect(
                context,
                () => context.go(AppRoutes.initScreen),
              );
            },
            style: AppButtonStyles.buttonYellowSize511x77Rounded20.copyWith(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    ResponsiveValue<double>(
                      context,
                      defaultValue: 20,
                      conditionalValues: [
                        Condition.smallerThan(value: 10, name: DESKTOP)
                      ],
                    ).value!,
                  ),
                ),
              ),
              fixedSize: MaterialStatePropertyAll(
                Size(
                  ResponsiveValue<double>(
                    context,
                    defaultValue: 511,
                    conditionalValues: [
                      Condition.smallerThan(value: 511 / 2, name: DESKTOP)
                    ],
                  ).value!,
                  ResponsiveValue<double>(
                    context,
                    defaultValue: 77,
                    conditionalValues: [
                      Condition.smallerThan(value: 77 / 2, name: DESKTOP)
                    ],
                  ).value!,
                ),
              ),
            ),
            child: Text(
              "استكشاف قائمة حضرموت حمزة",
              style: AppTextStyles.font24WhiteSemiBold.copyWith(
                fontSize: ResponsiveValue<double>(
                  context,
                  defaultValue: 24,
                  conditionalValues: [
                    Condition.smallerThan(value: 16, name: DESKTOP)
                  ],
                ).value!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
