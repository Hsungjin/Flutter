import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
              path: '/',
              name: 'home',
              builder: (context, _) => const HomeWidget()),
          GoRoute(
              path: '/new',
              name: 'new',
              builder: (context, _) => const GoRoutePage()),
          GoRoute(
              path: '/new2',
              name: 'new2',
              builder: (context, _) => const GoRoutePage2()),
        ],
      ),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Route Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                context.pushNamed('new');
              },
              child: const Text('Go To Page1')),
        ],
      ),
    );
  }
}

class GoRoutePage extends StatefulWidget {
  const GoRoutePage({super.key});

  @override
  State<GoRoutePage> createState() => _GoRoutePageState();
}

class _GoRoutePageState extends State<GoRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Route Page1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                context.pushNamed('new2');
              },
              child: const Text('Go To Page2')),
          TextButton(
              onPressed: () => context.pop(), child: const Text('Go To Back')),
        ],
      ),
    );
  }
}

class GoRoutePage2 extends StatefulWidget {
  const GoRoutePage2({super.key});

  @override
  State<GoRoutePage2> createState() => _GoRoutePage2State();
}

class _GoRoutePage2State extends State<GoRoutePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Route Page2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Go To Back')),
          TextButton(
              onPressed: () {
                context.goNamed('home');
              },
              child: const Text('Go To Home')),
        ],
      ),
    );
  }
}
