import 'package:hadrmouthamza/core/widgets/MyText.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartNoData extends StatelessWidget {
  const BuildCartNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.yellowOp25,
          size: 50.w,
        ),
        const MyText(
          title: "عربة التسوق فارغة",
          color: AppColors.blackOp75,
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
        ),
        const MyText(
          title: "الرجاء اضافة بعض العناصر من القائمة",
          color: AppColors.blackOp75,
          size: 12,
        ),
        const SizedBox(
          height: 10,
        ),
        DefaultButton(
          onTap: (){},
          title: "استكشاف قائمة حضرموت حمزة",
          color: AppColors.yellowOp75,
          borderColor: AppColors.yellowOp75,
          textColor: AppColors.whiteOp100,
          fontWeight: FontWeight.bold,
          width: 300,
        ),
      ],
    );
  }
}
