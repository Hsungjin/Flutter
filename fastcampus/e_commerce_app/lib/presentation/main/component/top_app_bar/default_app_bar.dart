import 'package:e_commerce_app/presentation/main/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  final BottomNav bottomNav;

  const DefaultAppBar(this.bottomNav, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
          title: Text(
            bottomNav.toName,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
