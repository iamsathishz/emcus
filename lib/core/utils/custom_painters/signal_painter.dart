import 'dart:math';
import 'package:flutter/material.dart';

class SignalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final dottedLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    final redArrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1;

    final routerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Dimensions
    final double routerWidth = 20;
    final double spacing = 5;
    final double endX = size.width - 10;
    final double centerY = size.height / 2;

    // Draw Router (simple representation)
    final routerPath = Path();
    routerPath.moveTo(routerWidth, centerY - 10);
    routerPath.lineTo(0, centerY - 5);
    routerPath.lineTo(0, centerY + 5);
    routerPath.lineTo(routerWidth, centerY + 10);
    routerPath.close();
    canvas.drawPath(routerPath, routerPaint);

    // Draw Top dotted line
    _drawDottedLine(
      canvas,
      Offset(routerWidth + spacing, centerY - 2),
      Offset(endX, centerY - 10),
      dottedLinePaint,
    );

    // Draw Bottom dotted line
    _drawDottedLine(
      canvas,
      Offset(routerWidth + spacing, centerY + 2),
      Offset(endX, centerY + 10),
      dottedLinePaint,
    );

    // Draw Red arrow (centered)
    final redArrowStart = Offset(endX, centerY);
    final redArrowEnd =
        Offset(routerWidth + spacing + size.width / 1.5, centerY);
    canvas.drawLine(redArrowStart, redArrowEnd, redArrowPaint);

    // Draw red arrowhead
    final arrowHeadSize = 5;
    final path = Path();
    path.moveTo(redArrowEnd.dx, redArrowEnd.dy);
    path.lineTo(redArrowEnd.dx + arrowHeadSize, redArrowEnd.dy - arrowHeadSize);
    path.lineTo(redArrowEnd.dx + arrowHeadSize, redArrowEnd.dy + arrowHeadSize);
    path.close();
    canvas.drawPath(path, redArrowPaint);

    // Draw double vertical lines at end
    final line1X = endX;
    final line2X = endX + 3;
    canvas.drawLine(Offset(line1X, centerY - 15), Offset(line1X, centerY + 15),
        dottedLinePaint);
    canvas.drawLine(Offset(line2X, centerY - 15), Offset(line2X, centerY + 15),
        dottedLinePaint);
  }

  void _drawDottedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const double dashWidth = 5;
    const double dashSpace = 4;
    final double dx = end.dx - start.dx;
    final double dy = end.dy - start.dy;
    final double distance = sqrt(dx * dx + dy * dy);
    final double steps = distance / (dashWidth + dashSpace);
    final double stepX = dx / steps;
    final double stepY = dy / steps;

    double currentX = start.dx;
    double currentY = start.dy;

    for (int i = 0; i < steps; i++) {
      final nextX = currentX + stepX;
      final nextY = currentY + stepY;
      canvas.drawLine(
        Offset(currentX, currentY),
        Offset(currentX + stepX * (dashWidth / (dashWidth + dashSpace)),
            currentY + stepY * (dashWidth / (dashWidth + dashSpace))),
        paint,
      );
      currentX = nextX;
      currentY = nextY;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
