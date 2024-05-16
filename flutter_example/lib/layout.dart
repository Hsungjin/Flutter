import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget을 상하로 좌우로 배치하기'),
        ),
        body: const Column(
          children: [
            // const Body(),
            // const Body2(),
            // const Body3(),
            // Body4(),
            Body5(),
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
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.red,
            //   margin: const EdgeInsets.symmetric(vertical: 8),
            // ),
            // Expanded(
            //     child: Container(
            //   color: Colors.blue,
            // )),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.red,
            //   margin: const EdgeInsets.symmetric(vertical: 8),
            // ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.red,
            //   margin: const EdgeInsets.symmetric(vertical: 8),
            // ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.red,
            //   margin: const EdgeInsets.symmetric(vertical: 8),
            // ),
          ],
        ),
      ),
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

// Stack 관련
class Body4 extends StatelessWidget {
  const Body4({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 500,
          height: 500,
          color: Colors.pink,
        ),
        Container(
          width: 400,
          height: 400,
          color: Colors.black,
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
        // Positioned(
        //   bottom: 50,
        //   right: 50,
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     color: Colors.green,
        //   ),
        // ),
        Align(
          alignment: const Alignment(0.5, -0.5),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

// Stack에 관한 내용
class Body5 extends StatelessWidget {
  const Body5({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(150),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(140),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Count 0',
            style: TextStyle(
              color: Colors.red,
              fontSize: 42,
            ),
          ),
        ),
      ],
    );
  }
}
