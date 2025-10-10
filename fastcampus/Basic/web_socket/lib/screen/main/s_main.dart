import 'dart:convert';

import 'package:fast_app_base/common/widget/animated_number_text.dart';
import 'package:fast_app_base/common/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import '../../common/common.dart';
import 'w_menu_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  final wsUrl = Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade');
  late final channel = IOWebSocketChannel.connect(wsUrl);

  late final Stream<dynamic> stream;

  String priceString = 'Loading...';
  final List<double> priceList = [];

  final intervalDuration = 1.seconds;
  DateTime lastUpdateTime = DateTime.now();

  @override
  void initState() {
    stream = channel.stream;

    stream.listen((data) {
      final obj = json.decode(data);
      final price = double.parse(obj['p']);

      if (DateTime.now().difference(lastUpdateTime) > intervalDuration) {
        priceList.add(price);
        lastUpdateTime = DateTime.now();
        priceString = price.toDoubleStringAsFixed();
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedNumberText(priceString,
                    textStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    duration: const Duration(milliseconds: 500)),
                LineChartWidget(priceList, maxPrice: 1000000,)
              ],
            ),
          )
        ),
      ),
    );
  }
}
