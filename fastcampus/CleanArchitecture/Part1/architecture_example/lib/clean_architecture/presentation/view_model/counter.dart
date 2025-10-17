import 'package:architecture_example/clean_architecture/domain/domain.dart';
import 'package:flutter/material.dart';

class CounterViewModel {
  CounterViewModel(this._counterModel);

  final CounterModel _counterModel;

  final ValueNotifier<int> _counter = ValueNotifier(0);

  ValueNotifier<int> get counter => _counter;

  void increment() {
    _counterModel.increment();
    _update();
  }

  void decrement() {
    _counterModel.decrement();
    _update();
  }

  void _update() {
    _counter.value = _counterModel.counter;
  }
}