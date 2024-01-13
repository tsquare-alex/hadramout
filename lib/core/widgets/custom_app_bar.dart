import 'package:hadrmouthamza/res.dart';

import '../../features/cart/cubit/cart_cubit.dart';
import '../../src/app_export.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.appBarColor,
  });

  final Color? appBarColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: ResponsiveValue<double>(context,
          defaultValue: 93,
          conditionalValues: [
            Condition.smallerThan(value: 65, name: DESKTOP)
          ]).value!,
      backgroundColor: appBarColor ?? AppColors.greyOp100,
      pinned: true,
      surfaceTintColor: Colors.transparent,
      title: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => context.go(AppRoutes.initScreen),
        child: Padding(
          padding:  EdgeInsets.only(right: 30.r),
          child: Image.asset(
            Res.logo,
            width:  ResponsiveValue<double>(context,
                defaultValue: 70,
                conditionalValues: [
                  Condition.smallerThan(value: 50, name: DESKTOP)
                ]).value!,
            height:  ResponsiveValue<double>(context,
                defaultValue: 70,
                conditionalValues: [
                  Condition.smallerThan(value: 50, name: DESKTOP)
                ]).value!,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 60.r),
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => context.push(AppRoutes.cartScreen),
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
                    width: ResponsiveValue<double>(context,
                        defaultValue: 32,
                        conditionalValues: [
                          Condition.smallerThan(value: 24, name: DESKTOP)
                        ]).value!,
                    height: ResponsiveValue<double>(context,
                        defaultValue: 30,
                        conditionalValues: [
                          Condition.smallerThan(value: 22, name: DESKTOP)
                        ]).value!,
                    child: Image.asset(
                      Res.cartIcon,
                      width: ResponsiveValue<double>(context,
                          defaultValue: 26,
                          conditionalValues: [
                            Condition.smallerThan(value: 18, name: DESKTOP)
                          ]).value!,
                      height: ResponsiveValue<double>(context,
                          defaultValue: 24,
                          conditionalValues: [
                            Condition.smallerThan(value: 17, name: DESKTOP)
                          ]).value!,
                    ),
                  ),
                  Positioned(
                    bottom: ResponsiveValue<double>(context,
                        defaultValue: 21,
                        conditionalValues: [
                          Condition.smallerThan(value: 16, name: DESKTOP)
                        ]).value!,
                    left: ResponsiveValue<double>(context,
                        defaultValue: 21,
                        conditionalValues: [
                          Condition.smallerThan(value: 16, name: DESKTOP)
                        ]).value!,
                    child: Container(
                      width: ResponsiveValue<double>(context,
                          defaultValue: 20,
                          conditionalValues: [
                            Condition.smallerThan(value: 16, name: DESKTOP)
                          ]).value!,
                      height: ResponsiveValue<double>(context,
                          defaultValue: 20,
                          conditionalValues: [
                            Condition.smallerThan(value: 16, name: DESKTOP)
                          ]).value!,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.yellowOp100,
                      ),
                      child: Center(
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            var cubit = CartBloc.get(context);
                            return Text(
                              cubit.cartList.length.toString(),
                              style: AppTextStyles.font16WhiteBold.copyWith(
                                fontSize: ResponsiveValue<double>(
                                  context,
                                  defaultValue: 12,
                                  conditionalValues: [
                                    Condition.smallerThan(
                                        value: 10, name: DESKTOP)
                                  ],
                                ).value!,
                              ),
                            );
                          },
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
    );
  }
}
