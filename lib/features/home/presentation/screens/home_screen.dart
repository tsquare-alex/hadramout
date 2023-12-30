import 'package:hadrmouthamza/core/themes/styles.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "العروض الفردية",
      "عروض الصواني",
      "قسم الدجاج",
      "قسم اللحوم",
      "قسم المطبخ",
      "قسم المشويات",
      "قسم الطواجن",
      "قسم السلطات",
      "قسم المشروبات",
    ];

    List<String> titleImage = [
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
    ];

    List<String> bottomTitles = [
      "القائمه",
      "مواقع المطاعم",
      "طلب بالجمله",
      "سياسه الخصوصيه",
      "الشروط والاحكام",
    ];

    List<String> bottomTitlesIcons = [
      "insta_logo.png",
      "facebook_logo.png",
      "twitter_logo.png",
    ];

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/home_logo.png",
                  width: 100,
                  height: 100,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.yellowOp100,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 100),
            child: Text(
              "استكشاف القائمه",
              style: AppTextStyles.font24BlackSemiBold,
            ),
          ),
          SizedBox(
            height: 26,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 100),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    width: 240,
                    height: 208,
                    margin: EdgeInsetsDirectional.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      border: Border.all(
                        color: AppColors.blackOp10,
                      ),
                    ),
                    child: Center(
                      child: Image.network(
                        titleImage[index],
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  Text(
                    titles[index],
                    style: AppTextStyles.font20BlackMedium,
                  ),
                ],
              ),
              itemCount: titles.length,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 100),
            child: Text(
              "افضل العروض",
              style: AppTextStyles.font24BlackSemiBold,
            ),
          ),
          SizedBox(
            height: 26,
          ),
          SizedBox(
            height: 519,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.symmetric(horizontal: 100),
              itemBuilder: (context, index) => Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 347,
                    height: 421,
                    margin: EdgeInsetsDirectional.symmetric(
                      horizontal: 32,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: 180,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "صينية الحبايب",
                                  style: AppTextStyles.font20BlackSemiBold,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(
                              color: AppColors.blackOp10,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "1ك كفته + 2ك رز + 3 قطع دجاج + 1 ك طرب او 1/2 خروف مشوي",
                              style: AppTextStyles.font16BlackOp50Medium,
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Container(
                              width: 315,
                              height: 61,
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 12),
                              decoration: ShapeDecoration(
                                color: Color(0x0C5A2E15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "EGP 850",
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "EGP 750",
                                        style:
                                            AppTextStyles.font16BlackSemiBold,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 89,
                                    height: 40,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "تخصيص",
                                          style: AppTextStyles.font12BrownBold,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 18,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF5A2E15),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                          ),
                                          child: Center(
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
                      "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    top: 440,
                    right: 80,
                    left: 80,
                    child: Container(
                      width: 188,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          border: Border.all(color: AppColors.yellowOp100),
                          color: AppColors.whiteOp100),
                      child: Row(
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
              itemCount: titles.length,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 400,
              color: AppColors.darkBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "حضرموت  حمزه",
                    style: AppTextStyles.font32WhiteSemiBold,
                  ),
                  Text(
                    "قد سختلف توافر العناصر والاسعار والمشاركه ومناطق التواصل والرسوم ومتطلبات الشراء للتوصل",
                    style: AppTextStyles.font24WhiteOp50Medium,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 61,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        bottomTitles.length,
                        (ii) => Flexible(
                          // fit: FlexFit.tight,
                          child: Text(
                            bottomTitles[ii],
                            style: AppTextStyles.font32WhiteRegular,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bottomTitlesIcons.length,
                      (iii) => Image.asset(
                        "assets/images/${bottomTitlesIcons[iii]}",
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                  ),
                  Text(
                    " حضرموت حمزه جميع الحقوق محفوظه",
                    style: AppTextStyles.font24WhiteOp50Medium,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
