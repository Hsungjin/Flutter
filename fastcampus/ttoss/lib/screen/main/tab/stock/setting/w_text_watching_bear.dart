import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TextMachingBear extends StatefulWidget {
  final bool check;
  final bool handsUp;
  final double look;

  const TextMachingBear({super.key, required this.check, required this.handsUp, required this.look});

  @override
  State<TextMachingBear> createState() => _TextMachingBearState();
}

class _TextMachingBearState extends State<TextMachingBear> {
  late StateMachineController controller;
  late SMIBool smiCheck;
  late SMIBool smiHandsUp;
  late SMINumber smiLook;
  late SMITrigger smiSucess;
  late SMITrigger smiFail;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextMachingBear oldWidget) {
    if (oldWidget.check != widget.check) {
      smiCheck.value = widget.check;
    }

    if (oldWidget.handsUp != widget.handsUp) {
      smiHandsUp.value = widget.handsUp;
    }

    if (oldWidget.look != widget.look) {
      smiLook.value = widget.look;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      '$baseRivePath/login_screen_character.riv',
      stateMachines: ['State Machine 1'],
      onInit: (Artboard art) {
        controller = StateMachineController.fromArtboard(art, 'State Machine 1')!;
        controller.isActive = true;
        art.addController(controller);
        smiCheck = controller.findInput<bool>('Check') as SMIBool;
        smiHandsUp = controller.findInput<bool>('hands_up') as SMIBool;
        smiLook = controller.findInput<double>('Look') as SMINumber;
        smiSucess = controller.findInput<bool>('success') as SMITrigger;
        smiSucess = controller.findInput<bool>('fail') as SMITrigger;

      },
    );
  }
}
