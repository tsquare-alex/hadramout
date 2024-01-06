import 'package:hadrmouthamza/src/app_export.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 475,
      width: 350,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 27.5,
            child: Container(
              width: 347,
              height: 380,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 51),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.blackOp25,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "صينية الحبايب",
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
                    height: 6,
                  ),
                  const Divider(
                    color: AppColors.blackOp10,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    '1 ك كفتة + 2 ك رز + 3 قطع دجاج + 1 ك طرب او 1/2 خروف مشوي',
                    style: AppTextStyles.font16BlackOp50Medium,
                  ),
                  const Gap(22),
                  Container(
                    width: 315,
                    height: 61,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 12),
                    decoration: ShapeDecoration(
                      color: AppColors.brownOp05,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'EGP 750',
                      style: AppTextStyles.font20BlackSemiBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Image.network(
              "https://media.cnn.com/api/v1/images/stellar/prod/160929101749-essential-spanish-dish-paella-phaidon.jpg?q=w_1900,h_1069,x_0,y_0,c_fill/h_618",
              width: 245,
              fit: BoxFit.cover,
              height: 164,
            ),
          ),
          ElevatedButton(
            style: AppButtonStyles.buttonOutlinedYellowSize188x55Rounded10,
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.yellowOp100,
                  size: 20,
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
        ],
      ),
    );
  }
}
