import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_text_watching_bear.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({super.key, super.animation = NavAni.Fade});

  @override
  DialogState<NumberDialog> createState() => _NotificationDiaglogState();
}

class _NotificationDiaglogState extends DialogState<NumberDialog> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  final numberFocus = FocusNode();
  final passwordFocus = FocusNode();

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState() {
    numberController.addListener(() {
      setState(() {
        look = numberController.text.length.toDouble() * 1.5;
      });
    });

    numberFocus.addListener(() {
      setState(() {
        check = numberFocus.hasFocus;
      });
    });

    passwordFocus.addListener(() {
      setState(() {
        handsUp = passwordFocus.hasFocus;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
              child: Column(
            children: [
              "숫자를 입력해주세요".text.make(),
              SizedBox(
                width: 250,
                height: 250,
                child: TextMachingBear(
                  check: check,
                  handsUp: handsUp,
                  look: look,
                ),
              ),
              TextField(
                focusNode: numberFocus,
                controller: numberController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                obscureText: true,
                focusNode: passwordFocus,
                controller: passwordController,
                keyboardType: TextInputType.number,
              ),
              RoundButton(
                  text: "완료",
                  onTap: () {
                    final text = numberController.text;
                    int number = int.parse(text);
                    widget.hide(number);
                  })
            ],
          ))
        ],
      ),
    );
  }
}
