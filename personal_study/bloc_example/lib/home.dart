import 'package:bloc_example/router/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push(RoutePath.counter);
              },
              child: const Text('Go Counter'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(RoutePath.timer);
              },
              child: const Text('Go Timer'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(RoutePath.post);
              },
              child: const Text('Go Infinite List'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('');
              },
              child: const Text('Go Login'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('');
              },
              child: const Text('Go Weather'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('');
              },
              child: const Text('Go All'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('');
              },
              child: const Text('Go Firebase Login'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('');
              },
              child: const Text('Go Github Search'),
            ),
          ],
        ),
      ),
    );
  }
}