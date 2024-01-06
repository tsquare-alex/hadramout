import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartTitle extends StatelessWidget {
  const BuildCartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: const Text('عناصر عربة التسوق',style: AppTextStyles.font24BlackSemiBold,),
    );
  }
}
