import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../core/theme/custom/custom_theme.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../domain/model/display/menu/menu_model.dart';
import '../../bloc/menu_bloc/menu_bloc.dart';

class GlobalNavBar extends StatelessWidget {
  const GlobalNavBar(this.menus, {super.key});

  final List<MenuModel> menus;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Stack(
          children: [
            TabBar(
              tabs: List.generate(
                menus.length,
                (index) => Tab(text: menus[index].title),
              ),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              labelStyle: textTheme.titleSmall.semiBold,
              unselectedLabelStyle: textTheme.titleSmall.regular,
              unselectedLabelColor: colorScheme.contentSecondary,
            ),
            if (state.status == Status.loading)
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: 0.2),
                  child: Center(
                    child: Transform.scale(
                      scale: 0.5,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
