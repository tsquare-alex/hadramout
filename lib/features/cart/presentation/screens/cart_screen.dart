import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/data_source/cart_data_source.dart';
import 'package:hadrmouthamza/features/cart/data/repository/cart_repository.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_button.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_items.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_no_data.dart';
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
          return CustomScrollView(
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
                    padding: EdgeInsets.only(left: 8.0.r),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColors.yellowOp100,
                            size: 50,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.yellowOp100,
                          radius: 16,
                          child: Text(cubit.cartList.length.toString(), style: AppTextStyles
                              .font18WhiteBold,),
                        )
                      ],
                    ),

                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: cubit.cartList.isEmpty?BuildCartNoData():Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: MediaQuery.of(context).size.width*0.20),
                      child: Column(
                        children: [
                          BuildCartItems(data: data, model: cubit.cartList, cubit: cubit,),
                          BuildCartButton(data: data,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
