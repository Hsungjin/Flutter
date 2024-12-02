import 'package:bloc_tutorial/ex_multi_bloc_provider/sample_bloc_di_multi.dart';
import 'package:bloc_tutorial/ex_repository/repository_sample.dart';
import 'package:bloc_tutorial/ex_repository/repository_second_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderPage extends StatefulWidget {
  const MultiBlocProviderPage({super.key});

  @override
  State<MultiBlocProviderPage> createState() => _MultiBlocProviderPageState();
}

class _MultiBlocProviderPageState extends State<MultiBlocProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RepositorySample(),
        ),
        RepositoryProvider(
          create: (context) => RepositorySecondSample(),
        )
      ],
      child: BlocProvider(
        create: (context) => SampleBlocDIMulti(
          context.read<RepositorySample>(),
          context.read<RepositorySecondSample>(),
        ),
        child: SamplePage(),
      )
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SampleBlocDIMulti, int>(
              builder: (context, state) =>
                  Text(state.toString(), style: const TextStyle(fontSize: 70)),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<SampleBlocDIMulti>().add(SampleDIFirstEvent());
                  },
                  child: const Text('first')),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<SampleBlocDIMulti>().add(SampleDISecondEvent());
                  },
                  child: const Text('second'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
