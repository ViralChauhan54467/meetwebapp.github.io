import 'package:flutter/material.dart';
import 'package:meetwebapp/common/size/height_width.dart';
import 'package:meetwebapp/constants/app_colors.dart';

class CustomDividerPainter extends CustomPainter {
  final double width;

  CustomDividerPainter(this.width);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColor.primaryColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(width / 2, h5 / 3.5, width, 0);
    path.quadraticBezierTo(width / 2, -h5 / 2.5, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
