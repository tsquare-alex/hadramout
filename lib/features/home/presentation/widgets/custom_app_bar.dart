import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/themes/colors.dart';

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
