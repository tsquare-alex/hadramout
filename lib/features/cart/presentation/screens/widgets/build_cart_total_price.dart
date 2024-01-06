import 'package:hadrmouthamza/core/widgets/MyText.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildTotalPrice extends StatelessWidget {
  const BuildTotalPrice({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("الإجمالي",style: AppTextStyles.font16BlackSemiBold,),
          Row(
            children: [
              const MyText(
                title: "1250",
                color: AppColors.blackOp75,
                size: 13,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 5.w,
              ),
              const MyText(
                title: "EGP",
                color: AppColors.blackOp25,
                size: 10,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
