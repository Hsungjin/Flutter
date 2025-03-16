import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

  // TODO 로그인 bloc
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      // context.push(RoutePath.home);
      context.go(RoutePath.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 하드코딩 된 값 변경 할 것
      body: Center(
        child: SvgPicture.asset('assets/svg/main_logo.svg'),
      ),
      backgroundColor: const Color(0xFF5F0080),
    );
  }
}