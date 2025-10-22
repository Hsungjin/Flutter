import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state++;
    print("increment: $state");
  }

  void decrement() {
    state--;
    print("decrement: $state");
  }
}
