import 'package:count_state_manage_sample_bloc/src/getx/count_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXHome extends GetView<CountGetxController> {
  const GetXHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX 상태관리')),
      body: Center(
        child: Obx(
          () => Text(
            controller.count.toString(),
            style: const TextStyle(fontSize: 80),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 30),
          FloatingActionButton(
            onPressed: controller.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
