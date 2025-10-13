import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model.dart';
import 'package:provider_example/screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => CounterModel()),
        Provider(create: (context) => CounterModeModel()),
      ],
      child: const CounterApp(),
    ),
  );
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CounterScreen(),
    );
  }
}
