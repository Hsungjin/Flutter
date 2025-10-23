import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    print("""
      Provider added:
      - Name: ${context.provider.name}
      - Type: ${context.provider.runtimeType}
      - Value: $value
    """);
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    print("""
      Provider updated:
      - Name: ${context.provider.name}
      - Type: ${context.provider.runtimeType}
      - Previous Value: $previousValue
      - New Value: $newValue
    """);
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    print("""
      Provider disposed:
      - Name: ${context.provider.name}
      - Type: ${context.provider.runtimeType}
    """);
  }
}

final counterStateProvider = StateProvider<int>(
  (ref) => 0,
  name: 'counterStateProvider',
);

void main() {
  runApp(ProviderScope(observers: [ProviderLogger()], child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: MyHomePage()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MySecondPage()),
              ),
          child: Text("페이지 이동"),
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  const MySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter: ${ref.watch(counterStateProvider)}'),
                ElevatedButton(
                  onPressed:
                      () => ref.read(counterStateProvider.notifier).state++,
                  child: Text('Increment'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
