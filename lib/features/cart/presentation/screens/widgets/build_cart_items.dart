import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/models/cart.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/res.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartItems extends StatelessWidget {
  const BuildCartItems({super.key, required this.data, required this.model, required this.cubit});
  final CartScreenData data;
  final List<CartModel> model;
  final CartBloc cubit;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: model.length,
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
                    Text(
                      model[i].title,
                      style: AppTextStyles.font16BlackSemiBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(10.0),
                          //   side: BorderSide(
                          //     color: AppColors.yellowOp100,
                          //     width: 1.0,
                          //   ),
                          // ),
                          childrenPadding: const EdgeInsets.all(5),
                          title: const Text(
                            "تفاصيل",
                            style: AppTextStyles.font10YellowSemiBold,
                          ),
                          trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.yellowOp100,),
                          children: [
                            Text(
                              model[i].description??"",
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
                  Text(
                    model[i].totalPrice.toString(),
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>cubit.decrement(model[i], i),
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
                      Center(
                        child: Text(
                          model[i].quantity.toString(),
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
                          onTap: () =>cubit.increment(model[i]),
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
