import 'package:hadrmouthamza/src/app_export.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? textScaleFactor;

  const MyText({
    Key? key,
    required this.title,
    required this.color,
    required this.size,
    this.alien,
    this.fontFamily,
    this.decoration,
    this.overflow,
    this.fontWeight,
    this.textScaleFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alien ?? TextAlign.start,
      textScaleFactor: textScaleFactor ?? 1.2,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 16,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        overflow: overflow,
      ),
    );
  }
}
