import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_master/bloc/bloc_selector_bloc.dart';

class BlocSelectorPage extends StatelessWidget {
  const BlocSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocSelectorBloc(),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(
              selector: (state) => state.changeState,
              builder: (context, state) {
                return Icon(
                  Icons.favorite,
                  color: state ? Colors.red : Colors.grey,
                  size: 50,
                );
              },
            ),
            BlocBuilder<BlocSelectorBloc, BlocSelectorState>(
              buildWhen: (previous, current) => current.changeState,
              builder: (context, state) {
                return Text(state.value.toString(), style: TextStyle(fontSize: 70),);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                    context.read<BlocSelectorBloc>().add(ChangeStateEvent());
                  },
                  child: Text('상태변경'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<BlocSelectorBloc>().add(ValueEvent());
                  },
                  child: Text('값변경'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
