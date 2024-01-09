import 'package:hadrmouthamza/core/widgets/custom_app_bar.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_button.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_items.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_no_data.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_title.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                const CustomAppBar(appBarColor: AppColors.whiteOp100),
                cubit.cartList.isEmpty
                    ? const SliverFillRemaining(
                      hasScrollBody: false,
                        child: BuildCartNoData(),
                      )
                    : SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: ResponsiveValue<double>(context,
                                    defaultValue:
                                        MediaQuery.of(context).size.width *
                                            0.20,
                                    conditionalValues: [
                                      Condition.smallerThan(
                                          value: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          name: TABLET)
                                    ]).value!,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteOp100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const BuildCartTitle(),
                                    BuildCartItems(
                                      model: cubit.cartList,
                                      cubit: cubit,
                                    ),
                                    const BuildCartButton(),
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
