import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_master/bloc/sample_bloc.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: const SamplePage(),
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
            Text('Bloc provider sample'),
            BlocBuilder<SampleBloc, int>(
              builder: (context, state) {
                return Text(state.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<SampleBloc>().add(AddSampleEvent());
                  },
                  child: Text('+'),
                ),
                ElevatedButton(onPressed: () {
                    context.read<SampleBloc>().add(MinusSampleEvent());
                  },
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(SampleEvent());
        },
      ),
    );
  }
}
