import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/change_notifier_provider/simple_change_notifier_provier.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter: ${ref.watch(counterChangeNotifierProvider).counter}",
                ),
                ElevatedButton(
                  onPressed:
                      () => ref.read(counterChangeNotifierProvider).increment(),

                  child: Text("Increment"),
                ),
                ElevatedButton(
                  onPressed:
                      () => ref.read(counterChangeNotifierProvider).decrement(),
                  child: Text("Decrement"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
