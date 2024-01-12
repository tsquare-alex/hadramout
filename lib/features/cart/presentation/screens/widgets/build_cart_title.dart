import 'package:hadrmouthamza/src/app_export.dart';

class BuildCartTitle extends StatelessWidget {
  const BuildCartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        'عناصر عربة التسوق',
        style: AppTextStyles.font24BlackSemiBold.copyWith(
          fontSize: ResponsiveValue<double>(context,
              defaultValue: 22,
              conditionalValues: [
                Condition.smallerThan(value: 16, name: DESKTOP)
              ]).value!,
        ),
      ),
    );
  }
}
