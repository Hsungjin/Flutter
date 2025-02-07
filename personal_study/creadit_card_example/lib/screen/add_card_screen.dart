import 'package:creadit_card_example/my_router.dart';
import 'package:creadit_card_example/widget/back_card_painter.dart';
import 'package:creadit_card_example/widget/card_painter.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  bool isBackSide = false;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardExpirationDateController = TextEditingController();
  TextEditingController cardCvvController = TextEditingController();


  String cardNumber = '1234-5678-9012-3456';
  String cardHolderName = '흐성진';
  String cardExpirationDate = '01/25';
  String cardCvv = '123';

  String _formatCardNumber(String number) {
    final digitsOnly = number.replaceAll(RegExp(r'[^\d]'), '');
    final chunks = <String>[];
    for (var i = 0; i < digitsOnly.length; i += 4) {
      final end = i + 4;
      chunks.add(digitsOnly.substring(i, end > digitsOnly.length ? digitsOnly.length : end));
    }
    return chunks.join('-');
  }

  String _formatCardExpirationDate(String date) {
    final digitsOnly = date.replaceAll(RegExp(r'[^\d]'), '');
    final chunks = <String>[];
    for (var i = 0; i < digitsOnly.length; i += 2) {
      final end = i + 2;
      chunks.add(digitsOnly.substring(i, end > digitsOnly.length ? digitsOnly.length : end));
    }
    return chunks.join('/');
  }
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (isBackSide) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      isBackSide = !isBackSide;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 240,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(3.14159 * _animation.value),
                    alignment: Alignment.center,
                    child: _animation.value < 0.5
                        ? CustomPaint(
                            painter: CardPainter(
                              cardWidth: 300,
                              cardHeight: 200,
                              cardColor: Colors.blue,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 120,
                                  left: 20,
                                  child: Text(cardNumber, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                ),
                                Positioned(
                                  top: 160,
                                  left: 20,
                                  child: Text(cardHolderName, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                ),
                                Positioned(
                                  top: 160,
                                  right: 20,
                                  child: Text(cardExpirationDate, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          )
                        : Transform(
                            transform: Matrix4.identity()..rotateY(3.14159),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                CustomPaint(
                                  painter: BackCardPainter(
                                    cardWidth: 300,
                                    cardHeight: 200,
                                    cardColor: Colors.blue,
                                  ),
                                ),
                                Positioned(
                                  top: 30,
                                  right: 20,
                                  child: Text(cardCvv, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
            ),
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: '카드 번호',
              ),
              onTap: () {
                isBackSide = true;
                if (isBackSide) _flipCard();
              },
              maxLength: 19,
              buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) => null,
              onChanged: (value) {
                final formattedValue = _formatCardNumber(value);
                cardNumberController.value = TextEditingValue(
                  text: formattedValue,
                  selection: TextSelection.collapsed(offset: formattedValue.length),
                );
                setState(() {
                  cardNumber = formattedValue;
                });
              },
            ),
            TextField(
              controller: cardHolderNameController,
              decoration: InputDecoration(
                labelText: '카드 소유자 이름',
              ),
              onTap: () {
                isBackSide = true;
                if (isBackSide) _flipCard();
              },
              onChanged: (value) {
                setState(() {
                  cardHolderName = value;
                });
              },
            ),
            TextField(
              controller: cardExpirationDateController,
              decoration: InputDecoration(
                labelText: '카드 만료일',
              ),
              onTap: () {
                isBackSide = true;
                if (isBackSide) _flipCard();
              },
              maxLength: 5,
              buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) => null,
              onChanged: (value) {
                final formattedValue = _formatCardExpirationDate(value);
                cardExpirationDateController.value = TextEditingValue(
                  text: formattedValue,
                  selection: TextSelection.collapsed(offset: formattedValue.length),
                );
                setState(() {
                  cardExpirationDate = formattedValue;
                });
              },
            ),
            TextField(
              controller: cardCvvController,
              decoration: const InputDecoration(
                labelText: '카드 CVV',
              ),
              onTap: () {
                if (!isBackSide) _flipCard();
              },
              onChanged: (value) {
                setState(() {
                  cardCvv = value;
                });
              },
              maxLength: 3,
              buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) => null
            ),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                MyRouter.router.go('/');
              },
              child: Text('추가'),
            ),
            SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
          ],
        ),
      ),
    );
  }
}