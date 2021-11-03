import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({Key? key, this.diameter = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter/2),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff0A5D00);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height, 0),
        height: 200,
        width: size.width,
      ),
      3.1416,
      -3.1416,
      false,
      paint,
    );
    final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold
    );
    final textSpan = TextSpan(
      text: 'Retos',
      style: textStyle,

    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(110, 50);
    textPainter.paint(canvas, offset);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}