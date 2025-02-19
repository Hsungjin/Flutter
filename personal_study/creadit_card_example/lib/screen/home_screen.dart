import 'package:creadit_card_example/database/database_helper.dart';
import 'package:creadit_card_example/my_router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<Map<String, dynamic>> _cards = [];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    final cards = await _databaseHelper.getAllCards();
    setState(() {
      _cards = cards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('흐성진 페이'),
        actions: [
          IconButton(
            onPressed: () => MyRouter.router.push('/add-card'),
            icon: const Icon(
              Icons.add_card_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _cards.isEmpty
          ? const Center(
              child: Text(
                '카드가 없습니다.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: _cards.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Text(_cards[index]['card_name']),
                );
              },
            ),
    );
  }
}
