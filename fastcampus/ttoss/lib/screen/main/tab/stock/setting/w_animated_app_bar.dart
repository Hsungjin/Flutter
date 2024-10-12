import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nav/nav.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;


  const AnimatedAppBar(this.title, {required this.scrollController, required this.animationController, super.key});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  final duration = 10.ms;
  double scrollPosition = 0;
  // late Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
  late CurvedAnimation animation = CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);

  @override
  void initState() {
    widget.animationController.addListener(() {
      setState(() {});
    });

    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
  }

  bool get isTriggerd => scrollPosition > 80;

  bool get isNotTriggerd => !isTriggerd;

  double getValue(double initial, double target) {
    if (isTriggerd) {
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
              padding: EdgeInsets.only(
                  left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                  child: widget.title.text.make(),
                  style: TextStyle(
                      fontSize: getValue(30, 18), fontWeight: FontWeight.bold),
                  duration: duration),
            ),
            Positioned(
              left: animation.value * 200,
                          child: TweenAnimationBuilder<Color?>(
            duration: 1000.ms,
            tween: ColorTween(
                begin: Colors.green,
                end: isTriggerd ? Colors.orange : Colors.green),
            builder: (context, value, child) => ColorFiltered(
              colorFilter: ColorFilter.mode(
                  value ?? Colors.green, BlendMode.modulate),
              child: child,
            ),
            child: Image.asset(
              "$basePath/icon/map_point.png",
              height: 60,
              colorBlendMode: BlendMode.modulate,
            ),
                          ),
                        )
          ],
        ),
      ),
    );
  }
}
