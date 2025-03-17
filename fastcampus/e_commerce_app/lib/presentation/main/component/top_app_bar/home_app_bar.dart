import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/mall_type_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          color: state.theme.backgroundColor,
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AppIcons.mainLogo,
                colorFilter: ColorFilter.mode(
                  state.theme.logoColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: AnimatedContainer(
                decoration: BoxDecoration(
                  color: state.theme.containerColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: SizedBox(
                  height: 28,
                  child: DefaultTabController(
                    length: MallType.values.length,
                    initialIndex: state.index,
                    child: TabBar(
                        tabs: List.generate(
                            MallType.values.length,
                            (index) =>
                                Tab(text: MallType.values[index].toName),),
                        isScrollable: false,
                        indicator: BoxDecoration(
                            color: state.isMarket
                                ? Theme.of(context).colorScheme.surface
                                : Theme.of(context).colorScheme.primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        labelColor: state.isMarket
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                        labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        unselectedLabelColor: state.isMarket
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.contentPrimary,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.labelLarge,
                        onTap: (index) =>
                            context.read<MallTypeCubit>().changeIndex(index),
                        splashBorderRadius:
                            const BorderRadius.all(Radius.circular(30)),),
                  ),
                ),
                duration: const Duration(milliseconds: 400),),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  AppIcons.location,
                  colorFilter: ColorFilter.mode(
                    (state.isMarket)
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  AppIcons.cart,
                  colorFilter: ColorFilter.mode(
                    (state.isMarket)
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
            backgroundColor: state.theme.backgroundColor,
            centerTitle: true,
            leadingWidth: 86,
          ),
          duration: const Duration(milliseconds: 400),
        );
      },
    );
  }
}
