import 'dart:math';

import 'package:bloc_project_1/painter/convert_radian.dart';
import 'package:flutter/material.dart';

class SingaporeFlag extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final rect1 =
        Rect.fromPoints(const Offset(0, 0), Offset(width, height / 2));
    final paint1 = Paint()
      ..color = const Color.fromRGBO(255, 0, 0, 1)
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect1, paint1);

    final rect2 = Rect.fromPoints(Offset(0, height / 2), Offset(width, height));
    final Paint paint2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect2, paint2);

    // draw moon

    final Paint whitePaint = Paint()..color = Colors.white;
    final Path starPath1 = Path();
    starPath1
        .addOval(Rect.fromCircle(center: Offset(100, height / 4), radius: 50));
    starPath1.close();
    canvas.drawPath(starPath1, whitePaint);

    final Paint redPaint = Paint()..color = const Color.fromRGBO(255, 0, 0, 1);
    final Path starPath2 = Path();
    starPath2
        .addOval(Rect.fromCircle(center: Offset(120, height / 4), radius: 45));
    starPath2.close();
    canvas.drawPath(starPath2, redPaint);

    // draw stars
    final Offset rootPoint = Offset(130, height / 4);
    double banKinh = 30;

    final pointStar1 = Offset(rootPoint.dx, rootPoint.dy - banKinh);
    final pointStar2 = Offset(rootPoint.dx + banKinh * sin(ConvertToRadian(72)),
        rootPoint.dy - banKinh  * cos(ConvertToRadian(72)));
    final pointStar3 = Offset(rootPoint.dx + banKinh * sin(ConvertToRadian(36)),
        rootPoint.dy + banKinh * cos(ConvertToRadian(36)));
    final pointStar4 = Offset(rootPoint.dx - banKinh * sin(ConvertToRadian(36)),
        rootPoint.dy + banKinh * cos(ConvertToRadian(36)));
    final pointStar5 = Offset(rootPoint.dx - banKinh * sin(ConvertToRadian(72)),
        rootPoint.dy - banKinh  * cos(ConvertToRadian(72)));
    drawStar(canvas, pointStar1, 60);
    drawStar(canvas, pointStar2, 60);
    drawStar(canvas, pointStar3, 60);
    drawStar(canvas, pointStar4, 60);
    drawStar(canvas, pointStar5, 60);
  }

  void drawStar(Canvas canvas, Offset tam, double width) {
    final goc = tam;
    final bankinh = width / 5;

    final pointA = Offset(goc.dx, goc.dy - bankinh);
    final pointB = Offset(goc.dx + bankinh * sin(ConvertToRadian(72)),
        goc.dy - bankinh * cos(ConvertToRadian(72)));
    final pointC = Offset(goc.dx + bankinh * sin(ConvertToRadian(36)),
        goc.dy + bankinh * cos(ConvertToRadian(36)));

    final pointD = Offset(goc.dx - bankinh * sin(ConvertToRadian(36)),
        goc.dy + bankinh * cos(ConvertToRadian(36)));
    final pointE = Offset(goc.dx - bankinh * sin(ConvertToRadian(72)),
        goc.dy - bankinh * cos(ConvertToRadian(72)));
    final Path path = Path()
      ..moveTo(pointA.dx, pointA.dy)
      ..lineTo(pointC.dx, pointC.dy)
      ..lineTo(pointE.dx, pointE.dy)
      ..lineTo(pointB.dx, pointB.dy)
      ..lineTo(pointD.dx, pointD.dy);
    final Paint paintWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paintWhite);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
