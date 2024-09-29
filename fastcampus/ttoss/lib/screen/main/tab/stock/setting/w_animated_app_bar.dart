import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nav/nav.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController controller;

  const AnimatedAppBar(this.title, {required this.controller, super.key});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  final duration = 10.ms;
  double scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        scrollPosition = widget.controller.position.pixels;
      });
    });
  }

  bool get isTriggerd => scrollPosition > 80;
  bool get isNotTriggerd => !isTriggerd;

  double getValue(double initial, double target) {
    if(isTriggerd) {
      return target;
    }

    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Nav.pop(context);
              },
              child: Arrow(
                direction: AxisDirection.left,
              ),
            ).p(20),
            AnimatedContainer(
                duration: duration,
                padding: EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
                child: AnimatedDefaultTextStyle(
                    child: widget.title.text.make(),
                    style: TextStyle(fontSize: getValue(30, 18), fontWeight: FontWeight.bold),
                    duration: duration)),
          ],
        ),
      ),
    );
  }
}
