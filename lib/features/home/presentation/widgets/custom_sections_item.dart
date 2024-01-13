import 'package:cached_network_image/cached_network_image.dart';
import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/res.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class CustomSectionsItem extends StatelessWidget {
  const CustomSectionsItem({super.key, required this.section});

  final SectionModel section;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ResponsiveValue<double>(context,
              defaultValue: 200,
              conditionalValues: [
                Condition.smallerThan(value: 120, name: DESKTOP)
              ]).value!,
          height: ResponsiveValue<double>(context,
              defaultValue: 160,
              conditionalValues: [
                Condition.smallerThan(value: 100, name: DESKTOP)
              ]).value!,
          margin: EdgeInsets.only(
              bottom: ResponsiveValue<double>(context,
                  defaultValue: 16,
                  conditionalValues: [
                Condition.smallerThan(value: 8, name: DESKTOP)
              ]).value!),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.blackOp10,
            ),
          ),
          alignment: Alignment.center,
          child: section.image.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: section.image,
                  width: ResponsiveValue<double>(context,
                      defaultValue: 190,
                      conditionalValues: [
                        Condition.smallerThan(value: 110, name: DESKTOP)
                      ]).value!,
                  height: ResponsiveValue<double>(context,
                      defaultValue: 150,
                      conditionalValues: [
                        Condition.smallerThan(value: 90, name: DESKTOP)
                      ]).value!,
                  errorWidget: (context, url, error) => Image.asset(
                    Res.dashboard_logo,
                    width: ResponsiveValue<double>(context,
                        defaultValue: 190,
                        conditionalValues: [
                          Condition.smallerThan(value: 110, name: DESKTOP)
                        ]).value!,
                    height: ResponsiveValue<double>(context,
                        defaultValue: 150,
                        conditionalValues: [
                          Condition.smallerThan(value: 90, name: DESKTOP)
                        ]).value!,
                  ),
                )
              : Image.asset(
                  Res.dashboard_logo,
                  width: ResponsiveValue<double>(context,
                      defaultValue: 190,
                      conditionalValues: [
                        Condition.smallerThan(value: 110, name: DESKTOP)
                      ]).value!,
                  height: ResponsiveValue<double>(context,
                      defaultValue: 150,
                      conditionalValues: [
                        Condition.smallerThan(value: 90, name: DESKTOP)
                      ]).value!,
                ),
        ),
        Text(
          section.title,
          style: AppTextStyles.font12BlackMedium.copyWith(
              fontSize: ResponsiveValue<double>(context,
                  defaultValue: 18,
                  conditionalValues: [
                Condition.smallerThan(value: 12, name: DESKTOP)
              ]).value!),
        )
      ],
    );
  }
}
