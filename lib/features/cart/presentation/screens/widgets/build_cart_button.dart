import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartButton extends StatelessWidget {
  const BuildCartButton({super.key, required this.data, });
  final CartScreenData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>context.read<CartBloc>().showCustomDialog(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.yellowOp100,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${context.watch<CartBloc>().totalCost}EGP",style: AppTextStyles.font18WhiteBold,),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("جميع الاسعار تشمل ضريبة القيمة المضافة",style: AppTextStyles.font10WhiteOp75Medium,),
                ],
              ),
            ),
            Row(
              children: [
                Text("اكمال الطلب",style: AppTextStyles.font16WhiteBold,),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.whiteOp100,
                  child: Icon(Icons.keyboard_arrow_left_outlined,size: 20,color: AppColors.yellowOp75,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
