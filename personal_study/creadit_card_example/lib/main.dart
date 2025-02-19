import 'package:creadit_card_example/my_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp.router(
      routerConfig: MyRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 기본 배경색
        scaffoldBackgroundColor: Colors.black54,

        // 엡비 섹상
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),

        // 텍스트 테마
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      )
    );
  }
}
