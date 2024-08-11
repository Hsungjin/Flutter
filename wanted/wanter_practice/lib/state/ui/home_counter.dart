import 'package:flutter/cupertino.dart';
import 'package:wanter_practice/state/ui/home.dart';

class HomeCounter extends StatefulWidget {
  const HomeCounter({super.key});

  @override
  State<HomeCounter> createState() => _HomeCounterState();
}

class _HomeCounterState extends State<HomeCounter> {
  late int _counter;

  void changeCounter() {
    setState(() {
      _counter = counter.value;
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = counter.value;
    counter.addListener(changeCounter);
  }


  @override
  void dispose() {
    counter.removeListener(changeCounter);
    counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_counter.toString());
  }
}
