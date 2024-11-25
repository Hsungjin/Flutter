import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetBindingObserver extends StatefulWidget {
  const WidgetBindingObserver({super.key});

  @override
  State<WidgetBindingObserver> createState() => _WidgetBindingObserverState();
}

class _WidgetBindingObserverState extends State<WidgetBindingObserver> with WidgetsBindingObserver {
  int counter = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
  }

  void _incrementCounter() {
    setState(() {
      counter += 1;
    });
  }

  void _startTimer() {
    print("타이머 시작한다");
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _incrementCounter(),
    );
  }

  void _stopTimer() {
    print("타이머 멈춘다");
    _timer.cancel();
  }

  void _taptaptap() {
    print("inactive 상태다 ${counter}");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopTimer();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        _stopTimer();
      case AppLifecycleState.resumed:
        _startTimer();
      case AppLifecycleState.inactive:
        _taptaptap();
      case AppLifecycleState.detached:
        print("앱 종료한다");
      default:
        print(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Binding Observer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Center(child: Text(counter.toString())),
    );
  }
}
