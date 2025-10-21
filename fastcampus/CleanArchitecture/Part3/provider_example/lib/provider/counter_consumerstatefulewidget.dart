import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/provider/counter_provider.dart';

class CounterStatefulWidget extends ConsumerStatefulWidget {
  const CounterStatefulWidget({super.key});

  @override
  ConsumerState<CounterStatefulWidget> createState() =>
      _CounterStatefulWidgetState();
}

class _CounterStatefulWidgetState extends ConsumerState<CounterStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.read(counterProvider);
    return ElevatedButton(
      onPressed: () => counter.increment(),
      child: Text("증가 시키기 ${counter.counterValue}"),
    );
  }
}
