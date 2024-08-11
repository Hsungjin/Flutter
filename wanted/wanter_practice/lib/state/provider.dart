import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int value = 0;

  void increment({int counter = 1}) {
    value += counter;
    notifyListeners();
  }

  void decrement({int counter = 1}) {
    value -= counter;
    notifyListeners();
  }
}