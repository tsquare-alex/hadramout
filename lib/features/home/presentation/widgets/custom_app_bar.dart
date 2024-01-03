import 'package:hadrmouthamza/src/app_export.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/home_logo.png",
          width: 100,
          height: 100,
        ),
        // Padding(
        //   padding: EdgeInsets.only(left: 8.0.r),
        //   child: Stack(
        //     children: [
        //       IconButton(
        //         onPressed: () {},
        //         icon: const Icon(
        //           Icons.shopping_cart_outlined,
        //           color: AppColors.yellowOp100,
        //           size: 40,
        //         ),
        //       ),
        //       CircleAvatar(
        //         backgroundColor: AppColors.yellowOp100,
        //         radius: 20.r,
        //         child: const Text(
        //           "1",
        //           style: AppTextStyles.font18WhiteBold,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.yellowOp100,
            size: 50,
          ),
        ),
      ],
    );
  }
}
