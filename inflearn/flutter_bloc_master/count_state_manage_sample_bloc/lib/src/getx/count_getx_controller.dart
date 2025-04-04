import 'package:get/get.dart';

class CountGetxController extends GetxController {
  var count = 0.obs;

  void increment() {
    count(count.value + 1);
  }

  void decrement() {
    count(count.value - 1);
  }
}
