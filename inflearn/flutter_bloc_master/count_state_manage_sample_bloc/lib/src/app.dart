import 'package:count_state_manage_sample_bloc/src/bloc/bloc_home.dart';
import 'package:count_state_manage_sample_bloc/src/bloc/count_bloc.dart';
import 'package:count_state_manage_sample_bloc/src/cubit/count_cubit.dart';
import 'package:count_state_manage_sample_bloc/src/cubit/cubit_home.dart';
import 'package:count_state_manage_sample_bloc/src/getx/count_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:count_state_manage_sample_bloc/src/getx/getx_home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('더하기 예')),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const GetXHome(),
                  binding: BindingsBuilder(() {
                    Get.put(CountGetxController());
                  }),
                  duration: Duration.zero,
                );
              },
              child: const Text('GetX 더하기'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => BlocProvider(
                    create: (context) => CountCubit(),
                    child: const CubitHome(),
                  ),
                  duration: Duration.zero,
                );
              },
              child: const Text('Cubit 더하기'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => BlocProvider(
                    create: (context) => CountBloc(),
                    child: const BlocHome(),
                  ),
                  duration: Duration.zero,
                );
              },
              child: const Text('Bloc 더하기'),
            ),
          ],
        ),
      ),
    );
  }
}
