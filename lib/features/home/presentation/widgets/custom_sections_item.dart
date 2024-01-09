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
          child: section.image.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: section.image,
                  width: 150,
                  height: 150,
                  errorWidget: (context, url, error) => Image.asset(
                    // Res.dashboard_logo,
                    ImageConstants.sectionImage,
                    width: 150,
                    height: 150,
                  ),
                )
              : Image.asset(
                  // Res.dashboard_logo,
                  ImageConstants.sectionImage,
                  width: 150,
                  height: 150,
                ),
        ),
        Text(
          section.title,
          style: AppTextStyles.font20BlackMedium,
        )
      ],
    );
  }
}
