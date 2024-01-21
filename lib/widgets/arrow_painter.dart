import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';

class ArrowPainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Offset? corner;

  ArrowPainter({required this.start, required this.end, this.corner});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppStyles.pantone2
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(start.dx, start.dy);
    if (corner != null) {
      path.lineTo(corner!.dx, corner!.dy);
      path.lineTo(end.dx, end.dy);

      if (corner!.dy == start.dy) {
        double arrowHeadLength = 10.0;
        path.moveTo(end.dx, end.dy);
        path.lineTo(end.dx, end.dy - arrowHeadLength);
        path.moveTo(end.dx, end.dy);
        path.lineTo(end.dx, end.dy + arrowHeadLength);
      } else {
        double arrowHeadLength = 10.0;
        path.moveTo(end.dx, end.dy);
        path.lineTo(end.dx - arrowHeadLength, end.dy);
        path.moveTo(end.dx, end.dy);
        path.lineTo(end.dx + arrowHeadLength, end.dy);
      }
    } else {
      path.lineTo(end.dx, end.dy);

      const arrowSize = 10.0;
      path.moveTo(end.dx, end.dy);
      path.lineTo(end.dx - arrowSize, end.dy - arrowSize);
      path.moveTo(end.dx, end.dy);
      path.lineTo(end.dx + arrowSize, end.dy - arrowSize);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
