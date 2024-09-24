import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_stock.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StockItem extends StatelessWidget {
  final Stock stock;
  const StockItem(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(stock.stockImagePath, width: 50,),
          width20,
          (stock.name).text.size(18).bold.make(),
          emptyExpanded,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// (오늘의 가격 - 전날의 가격) %
              stock.todayPercentageString.text.color(stock.getPriceColor(context)).make(),
              "${stock.currentPrice.toComma()}원".text.color(context.appColors.veryBrightGrey).make(),
            ],
          ),
        ],
      ),
    );
  }
}
