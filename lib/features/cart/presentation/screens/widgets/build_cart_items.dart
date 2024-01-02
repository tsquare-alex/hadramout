import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartItems extends StatelessWidget {
  const BuildCartItems({super.key, required this.data});
  final CartScreenData data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, i) => Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteOp100,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.shadow, spreadRadius: 0, blurRadius: 12)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "صينية الحبايب",
                      style: AppTextStyles.font16BlackSemiBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: const ExpansionTile(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(10.0),
                          //   side: BorderSide(
                          //     color: AppColors.yellowOp100,
                          //     width: 1.0,
                          //   ),
                          // ),
                          childrenPadding: EdgeInsets.all(5),
                          title: Text(
                            "تفاصيل",
                            style: AppTextStyles.font10YellowSemiBold,
                          ),
                          trailing: Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.yellowOp100,),
                          children: [
                            Text(
                              "1ك كفتة + 2ك رز + 3 قطع دجاج + 1ك طرب او 1/2 خروف مشوي",
                              style: AppTextStyles.font16BlackOp50Medium,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    "750 EGP",
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: AppColors.whiteOp100,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  width: 1, color: AppColors.blackOp75)),
                          child: Image.asset(
                            Res.remove,
                            height: 15.35,
                            width: 12.3,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Center(
                        child: Text(
                          '1',
                          style: AppTextStyles.font16BlackBold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.yellowOp100,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.whiteOp100,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
