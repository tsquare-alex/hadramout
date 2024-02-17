import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
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
      toolbarHeight: 65,
      backgroundColor: appBarColor ?? AppColors.greyOp100,
      pinned: true,
      surfaceTintColor: Colors.transparent,
      title: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => context.go(AppRoutes.initScreen),
        child: Padding(
          padding: EdgeInsets.only(right: 30.r),
          child: Image.asset(
            Res.logo,
            width: 50,
            height: 50,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => context.read<HomeBloc>().openFacebookUrl(),
          child: Tooltip(
            message: 'زورنا عالفيسبوك',
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              ImageConstants.facebook,
              color: Colors.blue,
              width: 36,
              height: 36,
            ),
          ),
        ),
        const Gap(25),
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
              child: SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      Res.cartIcon,
                      width: 32,
                      height: 30,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
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
                                cubit.cartList.length.toString(),
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
        ),
      ],
    );
  }
}
