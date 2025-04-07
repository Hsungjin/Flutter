import 'package:bloc_to_communication_sample/src/bloc/license_bloc.dart';
import 'package:bloc_to_communication_sample/src/bloc/product_bloc.dart';
import 'package:bloc_to_communication_sample/src/components/buy_button.dart';
import 'package:bloc_to_communication_sample/src/components/loading.dart';
import 'package:bloc_to_communication_sample/src/components/lock_widget.dart';
import 'package:bloc_to_communication_sample/src/components/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc to Comunication'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DefaultItems(),
            const SizedBox(height: 50),
            _PayItems(),
          ],
      ),
      bottomNavigationBar: BuyBtn(onTap: () {
        context.read<LicenseBloc>().add(BuyLicenseEvent());
      }),
    );
  }
}

class _DefaultItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            '기본 권한 아이템',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        const SizedBox(height: 20),
        if (state is LoadingProductState) const Loading(),
        if (state is LoadedProductState) ProductsWidget(items: List.generate(state.defaultItems?.length ?? 0, (index) => 'item $index'))
      ],
    );
  }
}

class _PayItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            '유료 권한 아이템',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        const SizedBox(height: 20),
        if (state is LoadingProductState) const Loading(),
        if (state is LoadedProductState && state.payItems == null) LockWidget(),
        if (state is LoadedProductState && state.payItems != null) ProductsWidget(items: List.generate(state.payItems?.length ?? 0, (index) => 'item $index')),
      ],
    );
  }
}