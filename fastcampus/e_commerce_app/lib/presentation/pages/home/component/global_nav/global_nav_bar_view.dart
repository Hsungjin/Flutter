import 'package:flutter/material.dart';

import '../../../../../domain/model/display/menu/menu_model.dart';
import '../../../../main/cubit/mall_type_cubit.dart';

class GlobalNavBarView extends StatelessWidget {
  const GlobalNavBarView(this.menus, this.mallType, {super.key});

  final List<MenuModel> menus;
  final MallType mallType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List.generate(
          menus.length,
          (index) => Column(
            children: [
              Text('mallType: ${mallType}'),
              Text('data: ${menus[index].title}'),
            ],
          ),
        ),
      ),
    );
  }
}
