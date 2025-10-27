import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterNotifierProvider =
    NotifierProvider.autoDispose<CounterNotifier, int>(CounterNotifier.new);

final counterSimpleProvider = StateProvider.autoDispose<int>((ref) => 0);

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    final init = ref.read(counterSimpleProvider);
    return 0 + init;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

final counterStateNotifierProvider =
    StateNotifierProvider.autoDispose<CounterStateNotifier, int>(
      (ref) => CounterStateNotifier(),
    );

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
