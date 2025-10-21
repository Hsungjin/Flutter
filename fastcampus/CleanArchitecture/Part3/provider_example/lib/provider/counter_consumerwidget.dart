import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/provider/counter_provider.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.read(counterProvider);
    return ElevatedButton(
      onPressed: () => counter.increment(),
      child: Text("증가 시키기"),
    );
  }
}
