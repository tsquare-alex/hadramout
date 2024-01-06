import 'package:hadrmouthamza/res.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartNoData extends StatelessWidget {
  const BuildCartNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      width: 465,
      height: 507,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Res.cartNoItem,
            width: 200,
            height: 171,
          ),
          const Gap(
            16,
          ),
          const Text("عربة التسوق فارغة",style: AppTextStyles.font24BlackSemiBold,),
          const Gap(
            16,
          ),
          const Text(
            "الرجاء اضافة بعض العناصر من القائمة",
            style: AppTextStyles.font20BlackRegular,
          ),
          const Gap(
            16,
          ),
          ElevatedButton(onPressed: (){
            Router.neglect(
              context,
              () => context.go(AppRoutes.initScreen),
            );
          },style: AppButtonStyles.buttonYellowSize511x77Rounded20, child: const Text("استكشاف قائمة حضرموت حمزة",style: AppTextStyles.font24WhiteSemiBold,))
        ],
      ),
    );
  }
}
