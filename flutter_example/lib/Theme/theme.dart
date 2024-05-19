import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomeWidget(),
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(
          //   seedColor: Colors.indigo,
          // ),
          // colorScheme: const ColorScheme.dark(),
          // useMaterial3: false,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)
          // colorScheme: const ColorScheme.light(
          //   primary: Colors.indigo,
          //   secondary: Colors.green,
          //   tertiary: Colors.amber,
          // ),
          // appBarTheme: const AppBarTheme(
          //   backgroundColor: Colors.red,
          // ),
          ),
    ),
  );
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Press Count',
              style: textTheme.bodyMedium,
            ),
            Text(
              '$count',
              style: textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          count += 1;
        }),
      ),
    );
  }
}
