import 'package:creadit_card_example/my_router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('흐성진 페이'),
        actions: [
          IconButton(
            onPressed: () => MyRouter.router.push('/add-card'),
            icon: const Icon(Icons.add_card_outlined, color: Colors.white,),
          )
        ],
      ),
      body: Center(
        child: Text('Home Screen', style: Theme.of(context).textTheme.bodyLarge,),
      ),
    );
  }
}