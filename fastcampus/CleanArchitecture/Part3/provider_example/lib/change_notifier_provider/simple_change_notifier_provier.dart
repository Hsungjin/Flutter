import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterChangeNotifierProvider =
    ChangeNotifierProvider<CounterChangeNotifier>(
      (ref) => CounterChangeNotifier(),
    );

class CounterChangeNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
