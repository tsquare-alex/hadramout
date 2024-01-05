import 'package:hadrmouthamza/src/app_export.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 400,
        color: AppColors.darkBlue,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "حضرموت  حمزه",
            style: AppTextStyles.font32WhiteSemiBold,
          ),
          const Text(
            "قد يختلف توافر العناصر والاسعار والمشاركه ومناطق التوصيل والرسوم ومتطلبات الشراء للتوصيل",
            style: AppTextStyles.font24WhiteOp50Medium,
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            ImageConstants.facebook,
            width: 40.w,
            height: 40.h,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            " حضرموت حمزه جميع الحقوق محفوظه",
            style: AppTextStyles.font24WhiteOp50Medium,
          ),
        ]),
      ),
    );
  }
}
