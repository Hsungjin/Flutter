import 'package:bloc_tutorial/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = AppRouter.router;

    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
