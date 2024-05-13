import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Widget을 상하로 좌우로 배치하기'),
          ),
          body: Column(
            children: [
              // Body(),
              // Body2(),
              // Body3(),
              // Container(
              //   width: 50,
              //   height: 200,
              //   color: Colors.red,
              // ),
              // Expanded(
              //     child: Container(
              //   color: Colors.grey,
              //   width: 100,
              // )),
              // Flexible(
              //     flex: 1,
              //     child: Container(
              //       color: Colors.amber,
              //       width: 100,
              //     )),
              // Flexible(flex: 2, child: Container(color: Colors.blue)),
              // Flexible(flex: 3, child: Container(color: Colors.red)),
              // Flexible(flex: 4, child: Container(color: Colors.green)),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
              Expanded(
                  child: Container(
                color: Colors.blue,
              )),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
            ],
          )),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 80,
            color: Colors.red,
            child: const Text('Container1'),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.blue,
            child: const Text('Container2'),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.green,
            child: const Text('Container3'),
          ),
        ],
      ),
    );
  }
}

class Body2 extends StatelessWidget {
  const Body2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber.shade400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 80,
            color: Colors.red,
            child: const Text('Container1'),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.blue,
            child: const Text('Container2'),
          ),
          Container(
            width: 100,
            height: 80,
            color: Colors.green,
            child: const Text('Container3'),
          ),
        ],
      ),
    );
  }
}

class Body3 extends StatelessWidget {
  const Body3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 80,
              color: Colors.red,
              child: const Text('Container1'),
            ),
            Container(
              width: 100,
              height: 80,
              color: Colors.blue,
              child: const Text('Container2'),
            ),
            Container(
              width: 100,
              height: 80,
              color: Colors.green,
              child: const Text('Container3'),
            ),
          ],
        ),
        Container(
          width: 300,
          height: 120,
          color: Colors.cyan,
          child: const Text("Container4"),
        )
      ],
    );
  }
}
