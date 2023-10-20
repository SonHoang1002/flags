import 'dart:math';

import 'package:bloc_project_1/painter/convert_radian.dart';
import 'package:flutter/material.dart';

class VietNamFlagPainter extends CustomPainter {
  final double rootLength;

  VietNamFlagPainter(this.rootLength);

  @override
  void paint(Canvas canvas, Size size) {
    final toaDo = Offset(size.width / 2, size.height / 2);
    final height = size.width * 2 / 3;
    final width = size.width;
    final banKinh = width / 5;

    final Paint redPaint = Paint() // tạo paint màu đỏ để vẽ cờ đỏ
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTRB(0, 0, width, height), redPaint);

    final pointA = Offset(toaDo.dx + 0, toaDo.dy - banKinh);
    final pointB = Offset(toaDo.dx + banKinh * sin(ConvertToRadian(72)),
        toaDo.dy - banKinh * cos(ConvertToRadian(72)));
    final pointC = Offset(toaDo.dx + banKinh * sin(ConvertToRadian(36)),
        toaDo.dy + 1 * banKinh * cos(ConvertToRadian(36)));
    final pointD = Offset(toaDo.dx - banKinh * sin(ConvertToRadian(36)),
        toaDo.dy + 1 * banKinh * cos(ConvertToRadian(36)));
    final pointE = Offset(toaDo.dx - banKinh * sin(ConvertToRadian(72)),
        toaDo.dy - banKinh * cos(ConvertToRadian(72)));

    final Path path = Path()
      ..moveTo(pointA.dx, pointA.dy)
      ..lineTo(pointC.dx, pointC.dy)
      ..lineTo(pointE.dx, pointE.dy)
      ..lineTo(pointB.dx, pointB.dy)
      ..lineTo(pointD.dx, pointD.dy)
      ..close();

    final Paint yelowPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    final realPath = path.shift(Offset(0, -banKinh + 20));

    canvas.drawPath(realPath, yelowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
