import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_master/bloc/sample_bloc.dart';
import 'package:flutter_bloc_master/bloc/sample_second_bloc.dart';

class MultiBlocProviderPage extends StatelessWidget {
  const MultiBlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: ((context) => SampleBloc())),
      BlocProvider(create: ((context) => SampleSecondBloc())),
    ], child: SamplePage());
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Bloc Provider Sample'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<SampleBloc>().add(SampleEvent());
                    },
                    child: Text('+')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context.read<SampleSecondBloc>().add(SampleSecondEvent());
                    },
                    child: Text('-')),
              ],
            )
          ],
        ),
      ),
    );
  }
}