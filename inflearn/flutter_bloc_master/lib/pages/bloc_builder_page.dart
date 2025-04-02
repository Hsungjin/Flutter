import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_master/bloc/sample_bloc.dart';

class BlocBuilderPage extends StatelessWidget {
  const BlocBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => SampleBloc()),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  late SampleBloc sampleBloc;

  SamplePage({super.key});

  void _showMessage(BuildContext context) {
    sampleBloc = context.read<SampleBloc>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: const Text('Title'),
          content: BlocBuilder<SampleBloc, int>(
            bloc: sampleBloc,
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
          actions: [
            ElevatedButton(
              child: const Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SampleBloc, int>(
              builder: (context, state) {
                return Text(state.toString());
              },
              buildWhen: (previous, current) {
                return current % 2 == 0;
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
                ElevatedButton(
                  onPressed: () {
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
          _showMessage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
