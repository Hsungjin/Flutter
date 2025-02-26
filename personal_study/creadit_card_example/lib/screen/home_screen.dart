import 'dart:math';
import 'package:creadit_card_example/database/database_helper.dart';
import 'package:creadit_card_example/my_router.dart';
import 'package:creadit_card_example/widget/card_painter.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<Map<String, dynamic>> _cards = [];

  final CarouselSliderController _carouselController = CarouselSliderController();
  int currentCardIndex = 0;
  
  // 기울기 효과를 위한 변수
  double tiltX = 0.0; // X축 기울기 값
  double tiltY = 0.0; // Y축 기울기 값
  late AnimationController _animationController; // 애니메이션 컨트롤러
  bool isCardTilting = false; // 카드가 기울어지고 있는지 여부

  @override
  void initState() {
    super.initState();
    _loadCards();
    
    // 기울기 효과를 위한 애니메이션 컨트롤러 초기화
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300), // 애니메이션 지속 시간 설정
      vsync: this,
    );
    
    // 애니메이션 리스너 추가
    _animationController.addListener(() {
      setState(() {
        // 애니메이션 값에 따라 기울기 조정
        tiltX = tiltX * (1 - _animationController.value);
        tiltY = tiltY * (1 - _animationController.value);
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadCards() async {
    final cards = await _databaseHelper.getAllCards();
    setState(() {
      _cards = cards.reversed.toList();
    });
  }

  void _selectCard(int index) {
    setState(() {
      currentCardIndex = index;
    });
    // 선택한 카드를 중앙으로 이동
    _carouselController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // 사용자의 터치 위치에 따라 기울기 값 조절
  void _onPointerMove(Offset position, Size cardSize) {
    if (!isCardTilting) return;
    
    setState(() {
      // 카드 중심을 기준으로 기울기 계산
      final centerX = cardSize.width / 2;
      final centerY = cardSize.height / 2;
      
      // 터치 위치와 중심 간의 차이를 기반으로 기울기 계산
      tiltX = ((position.dy - centerY) / 10).clamp(-15.0, 15.0);
      tiltY = (-(position.dx - centerX) / 10).clamp(-15.0, 15.0);
    });
  }

  // 손을 떼면 원래 위치로 돌아가는 애니메이션 적용
  void _resetTilt() {
    isCardTilting = false;
    _animationController.forward(from: 0.0);
  }

  // String 또는 int 값을 Color로 변환하는 헬퍼 메서드
  Color _getColorFromDynamic(dynamic value) {
    if (value is int) {
      return Color(value);
    } else if (value is String) {
      // 16진수 문자열인 경우 (예: '#RRGGBB' 또는 '0xFFRRGGBB')
      if (value.startsWith('#')) {
        return Color(int.parse('0xFF${value.substring(1)}'));
      } else if (value.startsWith('0x')) {
        return Color(int.parse(value));
      }
    }
    // 기본값으로 흰색 반환
    return Colors.white;
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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 선택된 카드 표시 (기울기 효과 적용)
                      if (_cards.isNotEmpty)
                        GestureDetector(
                          onPanStart: (_) {
                            isCardTilting = true;
                          },
                          onPanUpdate: (details) {
                            _onPointerMove(details.localPosition, const Size(300, 200));
                          },
                          onPanEnd: (_) => _resetTilt(),
                          child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001) // 원근감 추가
                              ..rotateX(tiltX * (pi / 180))
                              ..rotateY(tiltY * (pi / 180)),
                            alignment: FractionalOffset.center,
                            child: CustomPaint(
                              painter: CardPainter(
                                cardWidth: 300,
                                cardHeight: 200,
                                cardColor: _getColorFromDynamic(_cards[currentCardIndex]['card_color']),
                              ),
                              child: SizedBox(
                                width: 300,
                                height: 200,
                                child: Stack(
                                  children: [
                                    // 빛 반사 효과 (기울기에 따라 투명도 변경)
                                    Positioned.fill(
                                      child: Opacity(
                                        opacity: (tiltX.abs() + tiltY.abs()) / 30,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white.withOpacity(0.7),
                                                Colors.transparent,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // 카드 번호
                                    Positioned(
                                      top: 120,
                                      left: 20,
                                      child: Text(
                                        _cards[currentCardIndex]['card_number'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // 카드 소유자 이름
                                    Positioned(
                                      top: 160,
                                      left: 20,
                                      child: Text(
                                        _cards[currentCardIndex]['card_name'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // 카드 만료일
                                    Positioned(
                                      top: 160,
                                      right: 20,
                                      child: Text(
                                        _cards[currentCardIndex]['card_expiration_date'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Transform.translate를 사용하여 위치 조정
                    Transform.translate(
                      offset: const Offset(-75, 0), // x축으로 -75 픽셀 이동
                      child: Container(
                        height: 120,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CarouselSlider.builder(
                          carouselController: _carouselController,
                          itemCount: _cards.length,
                          options: CarouselOptions(
                            height: 100,
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: _cards.length > 1,
                            initialPage: currentCardIndex,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              if (currentCardIndex != index) {
                                setState(() {
                                  currentCardIndex = index;
                                });
                              }
                            },
                            clipBehavior: Clip.none,
                            padEnds: true,
                            pageSnapping: true,
                            disableCenter: false,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            // 카드 색상 가져오기
                            final cardColor = _getColorFromDynamic(_cards[index]['card_color']);
                            
                            return GestureDetector(
                              onTap: () => _selectCard(index),
                              child: CustomPaint(
                                painter: CardPainter(
                                  cardWidth: 150,
                                  cardHeight: 90,
                                  cardColor: currentCardIndex == index
                                      ? cardColor
                                      : cardColor.withValues(alpha: 0.5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _cards.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _selectCard(entry.key),
                        child: Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentCardIndex == entry.key
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
    );
  }
}
