import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_cart_button.dart';
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
      body: CustomScrollView(
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
                      radius: 20.r,
                      child: const Text("2", style: AppTextStyles.font18WhiteBold,),
                    )
                  ],
                ),

              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // BuildCartAppBar(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      BuildCartItems(data: data,),
                      BuildCartButton(data: data,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
