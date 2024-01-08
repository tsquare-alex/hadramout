import 'package:hadrmouthamza/features/home/cubit/home_cubit.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "حضرموت  حمزة",
              style: AppTextStyles.font32WhiteSemiBold,
            ),
            const Text(
              "قد يختلف توافر العناصر والاسعار والمشاركة ومناطق التوصيل والرسوم ومتطلبات الشراء للتوصيل",
              textAlign: TextAlign.center,
              style: AppTextStyles.font24WhiteOp50Medium,
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => context.read<HomeBloc>().openUrl(),
              child: Image.asset(
                ImageConstants.facebook,
                width: 40,
                height: 40,
              ),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            const Text(
              "حضرموت حمزة جميع الحقوق محفوظة",
              style: AppTextStyles.font24WhiteOp50Medium,
            ),
          ],
        ),
      ),
    );
  }
}
