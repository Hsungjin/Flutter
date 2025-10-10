import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final Color? backgroundColor;

  const RoundedContainer(
      {super.key,
      required this.child,
        this.radius = 20,
        this.backgroundColor,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15)});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor ?? CustomTheme.dark.appColors.roundedLayouyBackground,
            borderRadius: BorderRadius.circular(radius)),
        child: child);
  }
}
