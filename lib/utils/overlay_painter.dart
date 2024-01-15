import 'package:flutter_ocr_verifik/utils/export_files.dart';

class OverlayPainter extends CustomPainter {
  final double screenWidth;
  final double screenHeight;

  OverlayPainter({required this.screenWidth, required this.screenHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = screenWidth * 0.45;

    const strokeWidth = 2.0;

    final circlePath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(screenWidth / 2, screenHeight / 2),
        radius: radius,
      ));

    final outerPath = Path()
      ..addRect(
        Rect.fromLTWH(
          0,
          0,
          screenWidth,
          screenHeight,
        ),
      );
    final overlayPath = Path.combine(
      PathOperation.difference,
      outerPath,
      circlePath,
    );

    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(overlayPath, paint);

    canvas.drawCircle(
      Offset(
        screenWidth / 2,
        screenHeight / 2,
      ),
      radius,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
