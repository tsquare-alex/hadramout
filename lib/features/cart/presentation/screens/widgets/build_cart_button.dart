import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartButton extends StatelessWidget {
  const BuildCartButton({super.key, required this.data});
  final CartScreenData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>data.showCustomDialog(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.yellowOp100,
          borderRadius: BorderRadius.circular(15)
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("500EGP",style: AppTextStyles.font18WhiteBold,),
                SizedBox(
                  height: 10,
                ),
                Text("جميع الاسعار تشمل ضريبة القيمة المضافة",style: AppTextStyles.font10WhiteOp75Medium,),
              ],
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
