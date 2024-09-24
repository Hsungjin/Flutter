import 'package:fast_app_base/app.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StockDetailScreen extends StatelessWidget {
  final String stockName;
  const StockDetailScreen({super.key, required this.stockName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            '주식 상세'.text.make(),
          ],
        ),
      ),
    );
  }
}
