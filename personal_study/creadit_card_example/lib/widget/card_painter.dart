import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  final double cardWidth;
  final double cardHeight;
  final Color cardColor;
  final String cardNumber;
  final String cardHolderName;
  final String cardExpirationDate;
  final String cardCvv;

  final double cardBoder = 20;

  const CardPainter({
    required this.cardWidth,
    required this.cardHeight,
    required this.cardColor,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cardExpirationDate,
    required this.cardCvv,
  });

  @override
  void paint(Canvas canvas, Size size) {
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}