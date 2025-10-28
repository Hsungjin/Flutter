import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';

GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _shellNavKey = GlobalKey<NavigatorState>();

final shellRouter = GoRouter(
  navigatorKey: _rootNavKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavKey,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Center(child: Text('홈 화면')),
        ),
        GoRoute(
          path: '/user/:userId',
          builder: (context, state) {
            final userId = state.pathParameters['userId'] ?? 'unknown';
            return UserScreen(userId: userId);
          },
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
      ],
      builder: (context, state, child) => HomeScreen(child: child),
    ),
  ],
);
