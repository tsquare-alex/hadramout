import 'package:hadrmouthamza/features/home/presentation/widgets/data_dummy.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "حضرموت  حمزه",
              style: AppTextStyles.font32WhiteSemiBold,
            ),
            const Text(
              "قد يختلف توافر العناصر والاسعار والمشاركه ومناطق التوصيل والرسوم ومتطلبات الشراء للتوصل",
              style: AppTextStyles.font24WhiteOp50Medium,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 61,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  HomeData.bottomTitles.length,
                  (ii) => Flexible(
                    // fit: FlexFit.tight,
                    child: Text(
                      HomeData.bottomTitles[ii],
                      style: AppTextStyles.font32WhiteRegular,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                HomeData.bottomTitlesIcons.length,
                (iii) => Image.asset(
                  HomeData.bottomTitlesIcons[iii],
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
            const Text(
              " حضرموت حمزه جميع الحقوق محفوظه",
              style: AppTextStyles.font24WhiteOp50Medium,
            ),
          ],
        ),
      ),
    );
  }
}
