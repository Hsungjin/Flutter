import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_master/bloc/sample_bloc_di.dart';
import 'package:flutter_bloc_master/repository/repository_sample.dart';

class RepositoryProviderPage extends StatelessWidget {
  const RepositoryProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: ((context) => RepositorySample()),
      child: BlocProvider(
        create: (context) => SampleBlocDI(context.read<RepositorySample>()),
        child: SamplePage(),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<SampleBlocDI, int>(builder: (context, state) {
              return Text(state.toString());
            })
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SampleBlocDI>().add(SampleDIEvent());
            },
            child: Text('Load'),
          )
        ],
      ),
    );
  }
}
