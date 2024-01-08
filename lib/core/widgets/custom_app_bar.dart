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
      toolbarHeight: 93,
      backgroundColor: appBarColor ?? AppColors.greyOp100,
      pinned: true,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 150,
      leading: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => context.go(AppRoutes.initScreen),
        child: Image.asset(
          Res.home_logo,
          width: 100,
          height: 100,
          alignment: Alignment.centerLeft,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 80),
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
                    width: 32,
                    height: 30,
                    child: Image.asset(
                      Res.cartIcon,
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
                      child: Center(
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            var cubit = CartBloc.get(context);
                            return Text(
                              cubit
                                  .cartList
                                  .length
                                  .toString(),
                              style: AppTextStyles.font12WhiteBold,
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
