import 'package:flutter/material.dart';

class BackCardPainter extends CustomPainter {
  final double cardWidth;
  final double cardHeight;
  final Color cardColor;
  final Color stripeColor;

  const BackCardPainter({
    required this.cardWidth,
    required this.cardHeight,
    required this.cardColor,
    this.stripeColor = Colors.black54,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = cardColor
      ..style = PaintingStyle.fill;

    final stripePaint = Paint()
      ..color = stripeColor
      ..style = PaintingStyle.fill;

    final signaturePaint = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.fill;

    // 모서리 곡률을 위한 제어점 거리
    final controlPointDistance = cardWidth / 15;

    // 모서리가 들어간 부분을 표현(카드 삼각형)
    final controlDepth = cardHeight * 0.1;

    // 카드 외곽선 그리기
    final path = Path()
      ..moveTo(controlPointDistance, 0)
      ..lineTo(cardWidth - controlPointDistance, 0)
      ..quadraticBezierTo(cardWidth, 0, cardWidth, controlPointDistance)
      ..lineTo(cardWidth, cardHeight - controlPointDistance)
      ..quadraticBezierTo(
          cardWidth, cardHeight, cardWidth - controlPointDistance, cardHeight)
      ..lineTo(controlPointDistance, cardHeight)
      ..quadraticBezierTo(0, cardHeight, 0, cardHeight - controlPointDistance)
      ..lineTo(0, cardHeight / 2 + cardHeight * 0.2)
      ..quadraticBezierTo(controlDepth, cardHeight / 2 + cardHeight * 0.15,
          controlDepth, cardHeight / 2 + cardHeight * 0.1)
      ..quadraticBezierTo(
          controlDepth, cardHeight / 2 + cardHeight * 0.05, 0, cardHeight / 2)
      ..lineTo(0, controlPointDistance)
      ..quadraticBezierTo(0, 0, controlPointDistance, 0)
      ..close();

    canvas.drawPath(path, backgroundPaint);

    // 마그네틱 스트라이프 그리기
    final stripeRect =
        Rect.fromLTWH(0, cardHeight * 0.15, cardWidth, cardHeight * 0.15);
    canvas.drawRect(stripeRect, stripePaint);

    // 서명란 그리기
    final signatureRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        cardWidth * 0.1,
        cardHeight * 0.6,
        cardWidth * 0.7,
        cardHeight * 0.15,
      ),
      const Radius.circular(4),
    );
    canvas.drawRRect(signatureRect, signaturePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
