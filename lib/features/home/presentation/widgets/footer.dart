import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 250,
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveValue<double>(context,
                defaultValue: 40,
                conditionalValues: [
              Condition.smallerThan(value: 40 / 2, name: DESKTOP)
            ]).value!),
        color: AppColors.darkBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "حضرموت  حمزة",
              style: AppTextStyles.font32WhiteSemiBold.copyWith(
                  fontSize: ResponsiveValue<double>(context,
                      defaultValue: 24,
                      conditionalValues: [
                    Condition.smallerThan(value: 18, name: DESKTOP)
                  ]).value!),
            ),
            Text(
              "قد يختلف توافر العناصر والاسعار والمشاركة ومناطق التوصيل والرسوم ومتطلبات الشراء للتوصيل",
              textAlign: TextAlign.center,
              style: AppTextStyles.font24WhiteOp50Medium.copyWith(
                  fontSize: ResponsiveValue<double>(context,
                      defaultValue: 16,
                      conditionalValues: [
                    Condition.smallerThan(value: 12, name: DESKTOP)
                  ]).value!),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => context.read<HomeBloc>().openFacebookUrl(),
                  child: Image.asset(
                    ImageConstants.facebook,
                    width: ResponsiveValue<double>(context,
                        defaultValue: 36,
                        conditionalValues: [
                          Condition.smallerThan(value: 40 / 2, name: DESKTOP)
                        ]).value!,
                    height: ResponsiveValue<double>(context,
                        defaultValue: 36,
                        conditionalValues: [
                          Condition.smallerThan(value: 40 / 2, name: DESKTOP)
                        ]).value!,
                  ),
                ),
                const Gap(8),
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => context.read<HomeBloc>().callLandline(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '0224470999',
                        style: AppTextStyles.font12WhiteBold.copyWith(
                            fontSize: ResponsiveValue<double>(context,
                                defaultValue: 14,
                                conditionalValues: [
                              Condition.smallerThan(value: 10, name: DESKTOP)
                            ]).value!),
                      ),
                      Icon(
                        Icons.phone_sharp,
                        color: AppColors.whiteOp100,
                        size: ResponsiveValue<double>(context,
                            defaultValue: 20,
                            conditionalValues: [
                              Condition.smallerThan(
                                  value: 24 / 2, name: DESKTOP)
                            ]).value!,
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => context.read<HomeBloc>().callMobile(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '01555400990',
                        style: AppTextStyles.font12WhiteBold.copyWith(
                            fontSize: ResponsiveValue<double>(context,
                                defaultValue: 14,
                                conditionalValues: [
                              Condition.smallerThan(value: 10, name: DESKTOP)
                            ]).value!),
                      ),
                      Icon(
                        Icons.phone_iphone_rounded,
                        color: AppColors.whiteOp100,
                        size: ResponsiveValue<double>(context,
                            defaultValue: 20,
                            conditionalValues: [
                              Condition.smallerThan(
                                  value: 24 / 2, name: DESKTOP)
                            ]).value!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Text(
              "حضرموت حمزة جميع الحقوق محفوظة",
              textAlign: TextAlign.center,
              style: AppTextStyles.font24WhiteOp50Medium.copyWith(
                  fontSize: ResponsiveValue<double>(context,
                      defaultValue: 20,
                      conditionalValues: [
                    Condition.smallerThan(value: 16, name: DESKTOP)
                  ]).value!),
            ),
          ],
        ),
      ),
    );
  }
}
