import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_master/bloc/sample_bloc_di_multi.dart';
import 'package:flutter_bloc_master/repository/repository_sample.dart';
import 'package:flutter_bloc_master/repository/repository_second_sample.dart';

class MultiRepositoryProviderPage extends StatelessWidget {
  const MultiRepositoryProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => RepositorySample()),
        RepositoryProvider(create: (context) => RepositorySecondSample()),
      ],
      child: BlocProvider(
        create:
            (context) => SampleBlocDiMulti(
              context.read<RepositorySample>(),
              context.read<RepositorySecondSample>(),
            ),
        child: SamplePage(),
      ),
    );
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
            BlocBuilder<SampleBlocDiMulti, int>(
              builder:
                  (context, state) =>
                      Text(state.toString(), style: TextStyle(fontSize: 70)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<SampleBlocDiMulti>().add(
                      SampleMultiDiFirstEvent(),
                    );
                  },
                  child: Text('first'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    context.read<SampleBlocDiMulti>().add(
                      SampleMultiDiSecondEvent(),
                    );
                  },
                  child: Text('second'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
