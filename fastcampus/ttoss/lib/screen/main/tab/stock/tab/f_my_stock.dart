import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/common/widget/w_long_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyAccount(context),
        height20,
        getMyStock(context),
      ],
    );
  }

  Widget getMyAccount(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: context.appColors.roundedLayouyBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height20,
            '계좌'.text.make(),
            Row(
              children: [
                '443원'.text.size(24).bold.make(),
                Arrow(),
                emptyExpanded,
                RoundedContainer(
                  child: '채우기'.text.size(12).make(),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  radius: 8,
                  backgroundColor: context.appColors.buttonBackground,
                ),
              ],
            ),
            height30,
            Line(
              color: context.appColors.divider,
            ),
            height10,
            LongButton(title: '주문내역'),
            LongButton(title: '판매수익'),
          ],
        ),
      );

  Widget getMyStock(BuildContext context) => Column(
    children: [
      Container(
            color: context.appColors.roundedLayouyBackground,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                height30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '관심주식'.text.bold.make(),
                    emptyExpanded,
                    '편집하기'.text.color(context.appColors.veryBrightGrey).make(),
                  ],
                ),
                height20,
                Tap(
                  onTap: () {
                    context.showSnackbar('기본');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        '기본'.text.make(),
                        const Arrow(
                          direction: AxisDirection.up,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      InterestStockList().pSymmetric(h: 20),
    ],
  );
}
