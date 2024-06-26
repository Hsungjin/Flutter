import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Body(),
      ),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count : $value',
            style: const TextStyle(fontSize: 30),
          ),
          TestButton(addCounter),
        ],
      ),
    );
  }

  void addCounter(int addValue) {
    setState(() {
      value = addValue + value;
    });
  }
}

class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: InkWell(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: const Text(
              'Up counter',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        onTap: () => callback.call(1),
        onDoubleTap: () => callback.call(5),
        onLongPress: () => callback.call(10),
      ),
    );
  }
}
