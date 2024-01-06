import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/themes/styles.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:hadrmouthamza/features/home/presentation/widgets/home_item_list.dart';

class SaladSectionDetalis extends StatelessWidget {
  const SaladSectionDetalis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              "قسم السلطات",
              style: AppTextStyles.font24BlackSemiBold,
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      ...List.generate(
                        20,
                        (index) => const Padding(
                          padding: EdgeInsets.all(28),
                          child: HomeItemList(),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
