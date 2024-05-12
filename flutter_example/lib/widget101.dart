import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('This is App bar'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.home),
//             onPressed: () {
//               print('Tab!');
//             },
//           ),
//           const Icon(Icons.play_arrow),
//         ],
//       ),
//       body: const TestWidget(),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.bug_report),
//         onPressed: () {
//           print('Tab Bug');
//         },
//       ),
//     ),
//   ));
// }

// class TestWidget extends StatelessWidget {
//   const TestWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//       child: Center(
//         child: Text(
//           "Hello, Flutter",
//           style: TextStyle(
//             fontSize: 60,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Study to Container'),
        ),
        body: const CustomContainer(),
      ),
    ),
  );
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        // margin: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(
          color: const Color(0xFF85D07B),
          border: Border.all(
            color: Colors.red,
            width: 5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              offset: const Offset(10, 10),
              blurRadius: 10,
              spreadRadius: 10,
            ),
            BoxShadow(
              color: Colors.blue.withOpacity(0.8),
              offset: const Offset(-10, -10),
              blurRadius: 10,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Container(
            color: Colors.yellow,
            child: const Text('Hello Container'),
          ),
        ),
      ),
    );
  }
}
