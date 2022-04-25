import 'dart:math';

import 'package:flutter/widgets.dart';

class DashedCirlcePainter extends CustomPainter {
  final double radius;
  final Color color;
  DashedCirlcePainter(this.radius, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    int dashCount = 32;
    var paint = Paint()
      ..strokeWidth = 1
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < dashCount; i++) {
      canvas.drawArc(
          Rect.fromCenter(
            center: Offset.zero,
            width: radius * 2,
            height: radius * 2,
          ),
          2 * i * pi / dashCount,
          (pi / dashCount),
          false,
          paint);
    }
  }

  @override
  bool shouldRepaint(DashedCirlcePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DashedCirlcePainter oldDelegate) => false;
}
