import 'package:flutter/material.dart';

class ThaiLandFlag extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height / 6;
    final width = size.width;
    final rectRed1 = Rect.fromPoints(const Offset(0, 0), Offset(width, height));
    final rectWhite1 =
        Rect.fromPoints(Offset(0, height), Offset(width, 2 * height));
    final rectBlue =
        Rect.fromPoints(Offset(0, 2 * height), Offset(width, 4 * height));
    final rectWhite2 =
        Rect.fromPoints(Offset(0, 4 * height), Offset(width, 5 * height));
    final rectRed2 =
        Rect.fromPoints(Offset(0, 5 * height), Offset(width, 6 * height));

    canvas.drawRect(rectRed1, paintColor(const Color.fromRGBO(206, 17, 38, 1)));
    canvas.drawRect(rectWhite1, paintColor(Colors.white));
    canvas.drawRect(rectBlue, paintColor(const Color.fromRGBO(0, 56, 168 ,1)));
    canvas.drawRect(rectWhite2, paintColor(Colors.white));
    canvas.drawRect(rectRed2, paintColor(const Color.fromRGBO(206, 17, 38, 1)));
  }

  Paint paintColor(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
