import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rive Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rive Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController idTextController = TextEditingController();
  final TextEditingController pwTextController = TextEditingController();
  final FocusNode idFocus = FocusNode();
  final FocusNode pwFocus = FocusNode();

  // StateMachine을 컨트롤 할 수 있게 도와주는 Controller
  late StateMachineController stateMachineController;
  late SMIBool _check;
  late SMINumber _look;
  late SMITrigger _sucess;
  late SMITrigger _fail;
  late SMIBool _handUp;
  
  void _onInit(Artboard art) {
    //StateMachine 이름 일치하게 입력
    stateMachineController = StateMachineController.fromArtboard(art, 'State Machine 1')!;
    stateMachineController.isActive = true;
    art.addController(stateMachineController);

    // Input에 있는 이름도 동일하게 입력
    _check = stateMachineController.findInput<bool>('Check') as SMIBool;
    _look = stateMachineController.findInput<double>('Look') as SMINumber;
    _sucess = stateMachineController.findInput<bool>('success') as SMITrigger;
    _fail = stateMachineController.findInput<bool>('fail') as SMITrigger;
    _handUp = stateMachineController.findInput<bool>('hands_up') as SMIBool;
  }

  @override
  void initState() {
    idTextController.addListener(() {
      setState(() {
        _look.value = idTextController.text.length.toDouble();
      });
    });

    idFocus.addListener(() {
      setState(() {
        _check.value = idFocus.hasFocus;
      });
    });

    pwFocus.addListener(() {
      _handUp.value = pwFocus.hasFocus;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: SizedBox(
                  width: 200,
                    height: 200,
                    child: RiveAnimation.asset('assets/login.riv', stateMachines: ['State Machine 1'] , onInit: _onInit, fit: BoxFit.fitWidth, alignment: Alignment.center,)),
              ),
              const SizedBox(height: 20),
              TextField(
                focusNode: idFocus,
                controller: idTextController,
                decoration: const InputDecoration(
                  hintText: "ID를 입력해주세요.",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                focusNode: pwFocus,
                obscureText: true,
                controller: pwTextController,
                decoration: const InputDecoration(
                  hintText: "PW를 입력해주세요.",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  if (idTextController.text == "123" && pwTextController.text == "123") {
                    _sucess.fire();
                  } else {
                    _fail.fire();
                  }
                },
                child: Text('로그인'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
