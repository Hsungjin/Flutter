import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/dialog/common_dialog.dart';
import '../../../core/utils/error/error_response.dart';
import '../../../domain/usecase/display/display_usecase.dart';
import '../../../service_locator.dart';
import '../../main/cubit/mall_type_cubit.dart';
import 'bloc/menu_bloc/menu_bloc.dart';
import 'component/global_nav/global_nav_bar.dart';
import 'component/global_nav/global_nav_bar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (context, state) {
      return BlocProvider(
        create: (_) => MenuBloc(locator<DisplayUsecase>())
          ..add(MenuInitialized(mallType: state)),
        child: const HomePageView(),
      );
    });
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MallTypeCubit, MallType>(
      listener: (_, state) =>
          context.read<MenuBloc>().add(MenuInitialized(mallType: state)),
      listenWhen: (previous, current) => previous.index != current.index,
      child: BlocConsumer<MenuBloc, MenuState>(
        builder: (_, state) {
          switch (state.status) {
            case Status.initial:
            case Status.loading:
              return DefaultTabController(
                key: ValueKey<MallType>(state.mallType),
                length: state.menus.length,
                child: Column(
                  children: [
                    GlobalNavBar(state.menus),
                    GlobalNavBarView(state.menus, state.mallType),
                  ],
                ),
              );
            case Status.success:
              return DefaultTabController(
                length: state.menus.length,
                child: Column(
                  children: [
                    GlobalNavBar(state.menus),
                    GlobalNavBarView(state.menus, state.mallType),
                  ],
                ),
              );
            case Status.error:
              return const Center(child: Text('error'));
          }
        },
        listener: (context, state) async {
          if (state.status == Status.error) {
            final bool result = await CommonDialog.errorDialog(
                    context, ErrorResponse(message: state.error.message)) ??
                false;
          }
        },
        listenWhen: (previous, current) => previous.status != current.status,
      ),
    );
  }
}
