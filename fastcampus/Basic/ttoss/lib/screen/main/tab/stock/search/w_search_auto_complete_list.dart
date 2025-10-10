import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchStockDataProvider {
  final TextEditingController controller;
  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = stock.name;
        return GestureDetector(
        onTap: () {
          controller.clear();
          searchData.addHistory(stock);
          Nav.push(StockDetailScreen(stockName: stockName));
        },
        child: stockName.text.make().p(20),
      );},
      itemCount: searchData.autoCompleteList.length,
    );
  }
}
