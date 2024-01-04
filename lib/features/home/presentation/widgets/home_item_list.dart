import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/themes/colors.dart';
import 'package:hadrmouthamza/core/themes/styles.dart';

class HomeItemList extends StatelessWidget {
  final String title;
  final String description;
  final String preOfferPrice;
  final String offerPrice;
  final String imageUrl;
  final Function()? onpress;
  final int itemCount;

  const HomeItemList({
    super.key,
    required this.itemCount,
    required this.onpress,
    required this.title,
    required this.description,
    required this.preOfferPrice,
    required this.offerPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 519,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 265,
              height: 315,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 90,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.font20BlackSemiBold,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Divider(
                        color: AppColors.blackOp10,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: AppTextStyles.font16BlackOp50Medium,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 315,
                        height: 61,
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 12),
                        decoration: ShapeDecoration(
                          color: const Color(0x0C5A2E15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  preOfferPrice,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  offerPrice,
                                  style: AppTextStyles.font16BlackSemiBold,
                                ),
                              ],
                            ),
                            Container(
                              width: 89,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "تخصيص",
                                    style: AppTextStyles.font12BrownBold,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 18,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF5A2E15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                    ),
                                    child: const Center(
                                        child: Icon(
                                      Icons.arrow_forward,
                                      size: 12,
                                      color: Colors.white,
                                    )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 350,
              top: 0,
              right: 51,
              left: 51,
              child: Image.network(
                imageUrl,
                // "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
              top: 390,
              child: ElevatedButton(
                style: AppButtonStyles.buttonOutlinedYellowSize188x55Rounded10,
                onPressed: onpress,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.yellowOp100,
                      size: 13,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "أضف إلي العربة",
                      style: AppTextStyles.font16YellowSemiBold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        itemCount: itemCount,
      ),
    );
  }
}
