import 'package:flutter_ocr_verifik/utils/export_files.dart';

Widget createOverlay() {
  return CustomPaint(
    painter: OverlayUtil(),
  );
}

class OverlayUtil extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(100, 100),
      const Offset(200, 200),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
