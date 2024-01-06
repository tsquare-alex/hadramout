import 'package:hadrmouthamza/src/app_export.dart';

class CustomSectionsItem extends StatelessWidget {
  const CustomSectionsItem({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 240,
          height: 208,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.blackOp10,
            ),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            ImageConstants.sectionImage,
            width: 200,
            height: 200,
          ),
        ),
        Text(
          title,
          style: AppTextStyles.font20BlackMedium,
        )
      ],
    );
  }
}
