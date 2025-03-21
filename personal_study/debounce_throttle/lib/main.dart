import 'dart:io';

import 'package:debounce_throttle/debounce.dart';
import 'package:debounce_throttle/throttle.dart';
import 'package:dio/dio.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int _nomalcounter = 0;
  int _debouncecounter = 0;
  int _throttlecounter = 0;

  void _incrementCounter() {
    setState(() {
      _nomalcounter++;
    });
    callAPI('nomal');
  }

  void _incrementDebounceCounter() {
    EasyDebounce.debounce('debounce', const Duration(milliseconds: 400), () {
      setState(() {
        _debouncecounter++;
      });
      callAPI('debounce');
    });
  }

  void _incrementThrottleCounter() {
    EasyThrottle.throttle('throttle', const Duration(milliseconds: 400), () {
      setState(() {
        _throttlecounter++;
      });
      callAPI('throttle');
    });
  }

  bool isDoing = false;

  void _tryCatchFinally() async {
    try {
      if (isDoing) {
        return;
      }
      isDoing = true;
      await callAPI('try');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isDoing = false;
    }
  }

  Future<void> callAPI(String method) async {
    await Future.delayed(Duration(milliseconds: 5000));
    Dio dio = Dio();
    Response response = await dio.get('http://localhost:8080/test');
    print(method + response.data);
  }

  Throttle throttle = Throttle(delay: const Duration(milliseconds: 400));
  Debounce debounce = Debounce(delay: const Duration(milliseconds: 400));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NormalAPI 호출 횟수: $_nomalcounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'DebounceAPI 호출 횟수: $_debouncecounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'ThrottleAPI 호출 횟수: $_throttlecounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _incrementCounter();
            // _incrementDebounceCounter();
            // _incrementThrottleCounter();
            _tryCatchFinally();

            // throttle.run(() {
            //   callAPI('Handmade throttle');
            // });
            // debounce.run(() {
            //   callAPI('Handmade debounce');
            // });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
    );
  }
}
