import 'package:bloc/bloc.dart';
import 'package:bloc_example/counter_observer.dart';
import 'package:bloc_example/router/routes.dart';
import 'package:bloc_example/simple_bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {
  // Bloc.observer = const CounterObserver();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}