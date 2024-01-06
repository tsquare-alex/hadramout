import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/themes/colors.dart';

class CutomSectionsItem extends StatelessWidget {
  const CutomSectionsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 240,
          height: 208,
          margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            border: Border.all(
              color: AppColors.blackOp10,
            ),
          ),
          child: Center(
            child: Image.network(
              "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
              width: 200,
              height: 200,
            ),
          ),
        ),
      ],
    );
  }
}
