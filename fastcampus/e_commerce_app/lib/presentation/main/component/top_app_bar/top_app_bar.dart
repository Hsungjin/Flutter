import 'package:e_commerce_app/presentation/main/component/top_app_bar/default_app_bar.dart';
import 'package:e_commerce_app/presentation/main/component/top_app_bar/home_app_bar.dart';
import 'package:e_commerce_app/presentation/main/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNav>(
      builder: (_, state) {
        switch (state) {
          case BottomNav.home:
            return const HomeAppBar();
          case BottomNav.category:
          case BottomNav.search:
          case BottomNav.user:
            return DefaultAppBar(state);
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
