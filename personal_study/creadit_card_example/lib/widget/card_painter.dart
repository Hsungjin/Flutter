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

    // 모서리가 들어간 부분을 표현(카드 삼각형)
    final controlDepth = cardHeight * 0.1;
    
    final path = Path()
      // 1번 포인트에서 시작
      ..moveTo(controlPointDistance, 0)
      
      // 1-2번 직선
      ..lineTo(cardWidth - controlPointDistance, 0)

      // 2-3번 곡선
      ..quadraticBezierTo(cardWidth, 0, cardWidth, controlPointDistance)
      
      // 3-4번 직선
      ..lineTo(cardWidth, cardHeight / 2)

      // 4-5번 곡선
      ..quadraticBezierTo(cardWidth - controlDepth,  cardHeight / 2 + cardHeight * 0.05, cardWidth - controlDepth, cardHeight / 2 + cardHeight * 0.1)

      // 5-6번 곡선
      ..quadraticBezierTo(cardWidth - controlDepth, cardHeight / 2 + cardHeight * 0.15, cardWidth, cardHeight / 2 + cardHeight * 0.2)

      // 6-7번 직선
      ..lineTo(cardWidth, cardHeight - controlPointDistance)

      // 7~8번 곡선
      ..quadraticBezierTo(cardWidth, cardHeight, cardWidth - controlPointDistance, cardHeight)

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