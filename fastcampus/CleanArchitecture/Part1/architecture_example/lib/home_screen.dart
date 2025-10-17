import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/mvc'),
              child: const Text('Go to MVC'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/mvvm'),
              child: const Text('Go to MVVM'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/clean-architecture'),
              child: const Text('Go to Clean Architecture'),
            ),
          ],
        ),
      ),
    );
  }
}
