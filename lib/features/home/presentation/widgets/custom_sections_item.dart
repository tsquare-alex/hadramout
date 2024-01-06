import 'package:hadrmouthamza/src/app_export.dart';

class CutomSectionsItem extends StatelessWidget {
  const CutomSectionsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 240,
          height: 208,
          margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            border: Border.all(
              color: AppColors.blackOp10,
            ),
          ),
          child: Center(
            child: Image.asset(
              ImageConstants.sectionImage,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ],
    );
  }
}
