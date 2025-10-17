import 'package:architecture_example/mvvm/model.dart';
import 'package:flutter/widgets.dart';

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

class CounterModeViewModel {
  final CounterModeModel _counterModeModel;

  CounterModeViewModel(this._counterModeModel);

  final ValueNotifier<CounterMode> _counterMode = ValueNotifier(
    CounterMode.plus,
  );

  ValueNotifier<CounterMode> get counterMode => _counterMode;

  void toggleMode() {
    _counterModeModel.toggleMode();
    _update();
  }

  void _update() {
    _counterMode.value = _counterModeModel.counterMode;
  }
}
