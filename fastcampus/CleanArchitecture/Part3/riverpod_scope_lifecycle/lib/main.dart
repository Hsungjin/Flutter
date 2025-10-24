import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterProvider = StateProvider<int>((ref) => 0);

final lifeCycleProvider = StateProvider.autoDispose<int>((ref) {
  Timer? timer;

  final link = ref.keepAlive();

  ref.onAddListener(() {
    print("Lifecycle Provider onAddListener");
  });

  ref.onRemoveListener(() {
    print("Lifecycle Provider onRemoveListener");
  });

  ref.onResume(() {
    print("Lifecycle Provider onResumeListener");
    timer?.cancel();
    timer = null;
  });

  ref.onCancel(() {
    print("Lifecycle Provider onCancelListener");
    timer = Timer(Duration(seconds: 5), () {
      link.close();
    });
  });

  ref.onDispose(() {
    print("Lifecycle Provider onDisposeListener");
    timer?.cancel();
    timer = null;
  });

  return 0;
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterScreen(),
            ProviderScope(overrides: [counterProvider], child: CounterScreen()),
            ProviderScope(
              overrides: [counterProvider.overrideWith((ref) => 10)],
              child: CounterScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(lifeCycleProvider);
    ref.listen(lifeCycleProvider, (previous, next) {
      print('LifeCycle Provider: $previous -> $next');
    });
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $counter'),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(lifeCycleProvider.notifier)
                    .update((state) => state + 1);
              },
              child: Text('증가시키기'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${ref.watch(counterProvider)}'),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => state + 1);
              },
              child: Text('증가시키기'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('Second Page로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
