import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  final double cardWidth;
  final double cardHeight;
  final Color cardColor;

  const CardPainter({
    required this.cardWidth,
    required this.cardHeight,
    required this.cardColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = cardColor
      ..style = PaintingStyle.fill;

    // 모서리 곡률을 위한 제어점 거리
    final controlPointDistance = cardWidth / 15;

    final cardDepth = cardHeight / 40;

    final path = Path()
      // 1번 포인트에서 시작
      ..moveTo(controlPointDistance, 0)

      // 1-2번 직선
      ..lineTo(cardWidth - controlPointDistance, 0)

      // 2-3번 곡선
      ..quadraticBezierTo(cardWidth, 0, cardWidth, controlPointDistance)

      //
      ..lineTo(cardWidth, cardHeight / 2 - cardDepth)
      ..quadraticBezierTo(cardWidth, cardHeight / 2, cardWidth - 10,
          cardHeight / 2 + cardDepth * 2)
      ..lineTo(cardWidth - 10, cardHeight / 2 + cardDepth * 2)
      ..quadraticBezierTo(
          cardWidth - cardDepth * 4,
          cardHeight / 2 + cardDepth * 4,
          cardWidth - cardDepth * 2,
          cardHeight / 2 + cardDepth * 6)
      ..lineTo(cardWidth - cardDepth * 2, cardHeight / 2 + cardDepth * 6)
      ..quadraticBezierTo(cardWidth, cardHeight / 2 + cardDepth * 9, cardWidth,
          cardHeight / 2 + cardDepth * 10)
      ..lineTo(cardWidth, cardHeight / 2 + cardDepth * 10)

      // 6-7번 직선
      ..lineTo(cardWidth, cardHeight - controlPointDistance)

      // 7~8번 곡선
      ..quadraticBezierTo(
          cardWidth, cardHeight, cardWidth - controlPointDistance, cardHeight)

      // 8-9번 직선
      ..lineTo(controlPointDistance, cardHeight)

      // 9-10번 곡선
      ..quadraticBezierTo(0, cardHeight, 0, cardHeight - controlPointDistance)

      // 10-11번 직선
      ..lineTo(0, controlPointDistance)

      // 11~1번 곡선
      ..quadraticBezierTo(0, 0, controlPointDistance, 0)
      ..close();

    canvas.drawPath(path, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
