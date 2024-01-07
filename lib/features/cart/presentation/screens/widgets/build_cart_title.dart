import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartTitle extends StatelessWidget {
  const BuildCartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Text('عناصر عربة التسوق',style: AppTextStyles.font24BlackSemiBold,),
    );
  }
}
