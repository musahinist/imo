import 'dart:math' as math;
import 'package:flutter/material.dart';

class CircleTextWrapper extends StatelessWidget {
  const CircleTextWrapper({
    Key? key,
    this.radius = 128,
    this.text =
        "Lorem Ipsum is simply dummy text of the printing and typesetting in Lorem Ipsum has been the industry's standard dummy text ever sinceepp Lorem Ipsum.",
    this.textStyle = const TextStyle(fontSize: 24, height: 1.3),
  }) : super(key: key);
  final double radius;
  final String text;

  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _Painter(
          radius,
          text,
          textStyle,
        ),
      );
}

class _Painter extends CustomPainter {
  _Painter(this.radius, this.text, this.textStyle, {this.padding = 12});
  final double radius;
  final String text;
  final double padding;

  final TextStyle textStyle;
  final _textPainter = TextPainter(textDirection: TextDirection.ltr);
  final Paint _paint = Paint()
    ..blendMode
    ..color = Colors.white
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, radius + padding, _paint);
    _setText(text);
    double verticalRemainder = (radius) % _textPainter.height;
    String lineText = "";

    double y = -radius + padding + verticalRemainder / 2;
    double x = math.sqrt(radius * radius - y * y);
    for (int i = 0; i < text.length; i++) {
      lineText += text[i];
      _setText(lineText);
      if (_textPainter.width > (Offset(-x, y) - Offset(x, y)).distance) {
        _setText(lineText.trim());
        _paintText(canvas, x, y);
        y += _textPainter.height;
        x = math.sqrt(radius * radius - y * y);
        lineText = "";
      }

      if (i == text.length - 1) {
        _setText(lineText.trim());
        _paintText(canvas, x, y);
      }
    }
  }

  void _setText(String t) {
    _textPainter.text = TextSpan(
      text: t,
      style: textStyle,
    );
    _textPainter.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );
  }

  void _paintText(Canvas canvas, double x, double y) {
    double centeredX =
        ((Offset(-x, y) - Offset(x, y)).distance - _textPainter.width) * .5;
    _textPainter.paint(
        canvas, Offset(-x + centeredX, y - _textPainter.height * .6));
    canvas.drawLine(Offset(-x, y), Offset(x, y), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
