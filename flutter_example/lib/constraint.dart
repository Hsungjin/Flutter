import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ConstraintsWidget(),
      ),
    );
  }
}

class ConstraintsWidget extends StatelessWidget {
  const ConstraintsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      color: Colors.blue,
      // child: Center(
      //   child: Container(
      //     // constraints: const BoxConstraints(
      //     //   minHeight: 200,
      //     //   minWidth: 200,
      //     //   maxHeight: 250,
      //     //   maxWidth: 250,
      //     // ),
      //     constraints: BoxConstraints.loose(const Size(200, 200)),
      //     // constraints: BoxConstraints.tight(const Size(200, 200)),
      //     color: Colors.red,
      //     height: 50,
      //     width: 50,
      //   ),
      // ),
      child: Center(
        // child: UnconstrainedBox(
        //   child: Container(
        //     width: 300,
        //     height: 700,
        //     color: Colors.green,
        //   ),
        // ),
        child: OverflowBox(
          child: Container(
            width: 300,
            height: 700,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
