import 'dart:math';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double phase;
  WavePainter(this.phase);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFB4FF3D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    const int waveCount = 8;
    const double waveGap = 12;
    const double amplitude = 20;
    const double frequency = 1;

    for (int i = 0; i < waveCount; i++) {
      final path = Path();
      final double yOffset = size.height - (i + 1) * waveGap;

      path.moveTo(0, yOffset);

      for (double x = 0; x <= size.width; x++) {
        final double y = yOffset +
            amplitude * sin((frequency * 2 * pi * x / size.width) + phase);
        path.lineTo(x, y);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) {
    return oldDelegate.phase != phase;
  }
}
