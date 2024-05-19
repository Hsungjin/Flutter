import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Body(),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeWidget();
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 화면 이동하기'),
      ),
      body: homeBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
        currentIndex: index,
        onTap: (newindex) => setState(() {
          index = newindex;
        }),
      ),
    );
  }

  Widget homeBody() {
    switch (index) {
      case 0:
        return const Center(
          child: Icon(Icons.home, size: 100),
        );
      case 1:
        return const Center(
          child: Icon(Icons.search, size: 100),
        );
      case 2:
        return const Center(
          child: Icon(Icons.person, size: 100),
        );
      default:
        return const Center(
          child: Icon(Icons.search, size: 100),
        );
    }
  }
}
