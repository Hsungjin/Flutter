import 'package:flutter/material.dart';
import 'package:flutter_example/navigator/new_page.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeWidget(),
  ));
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 화면 이동하기'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Go to Page 2'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const NewPage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
