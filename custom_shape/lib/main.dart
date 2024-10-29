import 'package:custom_shape/bubble_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                child: const SizedBox(height: 200, width: 200),
              ),

              SizedBox(height: 20,),

              DecoratedBox(
                decoration: ShapeDecoration( // <- this
                  color: Colors.amber,
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const SizedBox(height: 200, width: 200),
              ),

              SizedBox(height: 20,),

              DecoratedBox(
                decoration: ShapeDecoration(
                  shape: MessageShapeBorder(
                      borderRadius: 30,
                      fillColor: Color(0xFF7ADEFF)
                  ),
                  color: Color(0xFFd6f5ff),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20).copyWith(left: 30),
                  child: Text("Sample message text"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


