import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/data_source/cart_data_source.dart';
import 'package:hadrmouthamza/features/cart/data/repository/cart_repository.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_button.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_items.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_no_data.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_title.dart';
import 'package:hadrmouthamza/res.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartScreenData data = CartScreenData();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          var cubit = CartBloc.get(context);
          return Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            interactive: true,
            thickness: 6,
            controller: cubit.pageScrollController,
            child: CustomScrollView(
              controller: cubit.pageScrollController,
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  toolbarHeight: 93,
                  backgroundColor: AppColors.whiteOp100,
                  pinned: true,
                  surfaceTintColor: Colors.transparent,
                  leadingWidth: 100,
                  leading: Image.asset(
                    "assets/images/home_logo.png",
                    width: 100,
                    height: 100,
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.r),
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){},
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
                                    child: Text(
                                      cubit.cartList.length.toString(),
                                      style: AppTextStyles.font12WhiteBold,
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
                ),
                SliverToBoxAdapter(
                  child: cubit.cartList.isEmpty
                      ? const BuildCartNoData()
                      : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: ResponsiveValue<double>(
                                    context,defaultValue: MediaQuery.of(context).size.width * 0.20,
                                    conditionalValues: [
                                      Condition.smallerThan(value: MediaQuery.of(context).size.width * 0.10,name: TABLET)
                                    ]
                                  ).value!,),
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteOp100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BuildCartTitle(),
                                    BuildCartItems(
                                      data: data,
                                      model: cubit.cartList,
                                      cubit: cubit,
                                    ),
                                    BuildCartButton(
                                      data: data,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
