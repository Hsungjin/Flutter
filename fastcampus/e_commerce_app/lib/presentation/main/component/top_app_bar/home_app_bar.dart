import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
          title: const Text(
            '탭바',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leadingWidth: 86,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SvgPicture.asset(AppIcons.mainLogo),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.location,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.surface,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.cart,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.surface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
