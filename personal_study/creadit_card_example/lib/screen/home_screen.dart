import 'package:creadit_card_example/database/database_helper.dart';
import 'package:creadit_card_example/my_router.dart';
import 'package:creadit_card_example/widget/card_painter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<Map<String, dynamic>> _cards = [];

  late final PageController _pageController;
  int currentCardIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadCards();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.4,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
          : Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        '선택된 카드 인덱스: ${_cards[currentCardIndex]['name']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentCardIndex = index;
                      });
                    },
                    itemCount: _cards.length,
                    itemBuilder: (context, index) {
                      double value = 0.0;
                      if (_pageController.position.haveDimensions) {
                        value = index - (_pageController.page ?? 0);
                        value = (value * 0.3).clamp(-1, 1);
                      }

                      return Transform.scale(
                        scale: 1.0 - value.abs() * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CustomPaint(
                              painter: CardPainter(
                                cardWidth: 150,
                                cardHeight: 100,
                                cardColor: currentCardIndex == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [],
                  ),
                )
              ],
            ),
    );
  }
}
