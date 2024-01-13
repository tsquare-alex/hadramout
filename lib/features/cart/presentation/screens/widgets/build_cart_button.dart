import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartButton extends StatelessWidget {
  const BuildCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<CartBloc>().showCustomDialog(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.yellowOp100,
            borderRadius: BorderRadius.circular(
              ResponsiveValue<double>(
                context,
                defaultValue: 15,
                conditionalValues: [
                  Condition.smallerThan(value: 8, name: DESKTOP)
                ],
              ).value!,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${context.watch<CartBloc>().totalCost} جنيه",
                    style: AppTextStyles.font18WhiteBold.copyWith(
                      fontSize: ResponsiveValue<double>(
                        context,
                        defaultValue: 22,
                        conditionalValues: [
                          Condition.smallerThan(value: 18, name: DESKTOP)
                        ],
                      ).value!,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const Text(
                  //   "جميع الاسعار تشمل ضريبة القيمة المضافة",
                  //   style: AppTextStyles.font10WhiteOp75Medium,
                  // ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "اكمال الطلب",
                  style: AppTextStyles.font16WhiteBold.copyWith(
                    fontSize: ResponsiveValue<double>(
                      context,
                      defaultValue: 16,
                      conditionalValues: [
                        Condition.smallerThan(value: 14, name: DESKTOP)
                      ],
                    ).value!,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: ResponsiveValue<double>(
                    context,
                    defaultValue: 30,
                    conditionalValues: [
                      Condition.smallerThan(value: 20, name: DESKTOP)
                    ],
                  ).value!,
                  backgroundColor: AppColors.whiteOp100,
                  child: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: ResponsiveValue<double>(
                      context,
                      defaultValue: 20,
                      conditionalValues: [
                        Condition.smallerThan(value: 15, name: DESKTOP)
                      ],
                    ).value!,
                    color: AppColors.yellowOp75,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
