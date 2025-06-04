import 'package:flutter/material.dart';
import 'package:meetwebapp/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final double? textHeight;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? align;
  final int? maxLine;
  final TextDecoration? textDecoration;

  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      this.textHeight,
      this.color = AppColor.white,
      required this.fontWeight,
      this.align,
      this.maxLine,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLine,
      overflow: (maxLine != null) ? TextOverflow.ellipsis : null,
      style: TextStyle(
          height: textHeight,
          fontSize: size,
          color: color,
          decoration: textDecoration ?? TextDecoration.none,
          fontWeight: fontWeight),
    );
  }
}
