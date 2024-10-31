import 'package:flutter/material.dart';
import 'dart:math' as math;

class BubbleBorder extends OutlinedBorder {
  final double borderRadius;
  final double weight;

  const BubbleBorder({
    BorderSide side = BorderSide.none,
    this.borderRadius = 50,
    this.weight = 2.5,
  }) : super(side: side);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final strokeWidth = side.width;

    final double left = rect.left + strokeWidth;
    final double right = rect.right - strokeWidth;
    final double top = rect.top + strokeWidth;
    final double bottom = rect.bottom - strokeWidth;

    final radius = math.max(0, borderRadius - 10);
    final offset = 10;

    return Path()
      ..moveTo(left + offset + radius, bottom)
      ..conicTo(left + offset, bottom, left + offset, bottom - 2 * radius, weight)
      ..lineTo(left + offset, top + radius)
      ..conicTo(left + offset, top, left + offset + radius, top, weight)
      ..lineTo(right - radius, top)
      ..conicTo(right, top, right, top + radius, weight)
      ..lineTo(right, bottom - radius)
      ..conicTo(right, bottom, right - radius, bottom, weight)
      ..close();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double left = rect.left;
    final double right = rect.right;
    final double top = rect.top;
    final double bottom = rect.bottom;
    final radius = borderRadius;
    final offset = 10.0;

    return Path()
      ..moveTo(left, bottom)
      ..conicTo(left + offset, bottom - offset, left + offset, bottom - 2 * radius, weight)
      ..lineTo(left + offset, top + radius)
      ..conicTo(left + offset, top, left + offset + radius, top, weight)
      ..lineTo(right - radius, top)
      ..conicTo(right, top, right, top + radius, weight)
      ..lineTo(right, bottom - radius)
      ..conicTo(right, bottom, right - radius, bottom, weight)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(getInnerPath(rect), Paint()..color = side.color);
  }

  @override
  ShapeBorder scale(double t) {
    return BubbleBorder(
      side: side.scale(t),
      borderRadius: borderRadius * t,
      weight: weight * t,
    );
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return BubbleBorder(
      side: side ?? this.side,
      borderRadius: borderRadius,
      weight: weight,
    );
  }
}
