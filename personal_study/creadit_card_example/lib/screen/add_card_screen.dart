import 'package:creadit_card_example/my_router.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카드 추가'),
        leading: IconButton(
          onPressed: () => MyRouter.router.go('/'),
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
        ),
      ),
      body: const Center(
        child: Text('카드 추가'),
      ),
    );
  }
}