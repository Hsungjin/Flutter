import 'package:custom_shape/bubble_widget.dart';
import 'package:custom_shape/ticket_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dateIndicatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("CustomShape example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _item1(),
                SizedBox(height: 20),
                _item2(),
                SizedBox(height: 20),
                _item3(),
                SizedBox(height: 20),
                _item4(),
                SizedBox(height: 20),
                _item5(),
                SizedBox(height: 20),
                _item6(),
                SizedBox(height: 20),
                _item7(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        height: 50,
        width: 50,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        notchMargin: 20,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          children: [Text('123123213')],
        ),
      ),
    );
  }

  Widget _item1() {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: Color(0xFFd6f5ff),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20))
            .lerpTo(
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(1)), 0.4)!,
      ),
      child: const SizedBox(height: 200, width: 200),
    );
  }

  Widget _item2() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: Color(0xFFd6f5ff),
      ),
      child: const SizedBox(height: 200, width: 200),
    );
  }

  Widget _item3() {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: Colors.amber,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: const SizedBox(height: 200, width: 200),
    );
  }

  Widget _item4() {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: StarBorder(),
        color: Colors.amber,
      ),
      child: const SizedBox(height: 100, width: 100),
    );
  }

  Widget _item5() {
    return MessageBubble(text: "메세지다 야호야호");
  }

  Widget _item6() {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: MessageShapeBorder(
            borderRadius: 50,
            side: BorderSide(width: 0, color: Color(0xFF7ADEFF))),
        color: Color(0xFF7ADEFF),
      ),
      child: SizedBox(width: 500, height: 200),
    );
  }

  Widget _item7() {
    return ClipPath(
      clipper: const ShapeBorderClipper(
        shape: MessageShapeBorder(),
      ),
      child: Image.asset(
        "assets/tt.jpeg",
        height: 200,
        width: 300,
        fit: BoxFit.cover,
        cacheHeight: (300 * MediaQuery.of(context).devicePixelRatio).toInt(),
      ),
    );
  }

  Widget _item8() {
    return TicketItem(
      topChild: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Top child"),
          ],
        ),
      ),
      bottomChild: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (rectangle) => LinearGradient(
          begin: Alignment.topCenter,
          stops: [0, 1],
          colors: [Color(0xFFd6f5ff), Color(0x00d6f5ff)],
          end: Alignment.bottomCenter,
        ).createShader(rectangle),
        child: Image.asset(
          "assets/tt.jpeg",
          height: 200,
          width: 300,
          fit: BoxFit.cover,
          cacheHeight: (300 * MediaQuery.of(context).devicePixelRatio).toInt(),
        ),
      ),
    );
  }
}

class MessageBubble extends StatefulWidget {
  final String text;
  const MessageBubble({super.key, required this.text});

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: MessageShapeBorder(
          side: BorderSide(color: Color(0xFF7ADEFF), width: 8),
          weight: 2,
          borderRadius: 30,
        ),
        color: const Color(0xFFd6f5ff),
      ),
      child: Padding(
        padding: EdgeInsets.all(20).copyWith(left: 30),
        child: Text(widget.text),
      ),
    );
  }
}

class MessageShapeBorder extends OutlinedBorder {
  final double borderRadius;
  final double weight;
  // final Color fillColor;

  const MessageShapeBorder(
      {super.side,
        this.borderRadius = 50,
        /*required this.fillColor,*/ this.weight = 2.5});

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final strokeWidth = side.width;

    final double left = rect.left + strokeWidth;
    final double right = rect.right - strokeWidth;
    final double top = rect.top + strokeWidth;
    final double bottom = rect.bottom - strokeWidth;

    final radius = math.max(0, borderRadius - 10);
    final offset = 10;

    return Path()
      ..moveTo(left + offset + radius, bottom)
      ..conicTo(
          left + offset, bottom, left + offset, bottom - 2 * radius, weight)
      ..lineTo(left + offset, top + radius)
      ..conicTo(left + offset, top, left + offset + radius, top, weight)
      ..lineTo(right - radius, top)
      ..conicTo(right, top, right, top + radius, weight)
      ..lineTo(right, bottom - radius)
      ..conicTo(right, bottom, right - radius, bottom, weight)
      ..close();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double left = rect.left;
    final double right = rect.right;
    final double top = rect.top;
    final double bottom = rect.bottom;

    final radius = borderRadius;
    final offset = 10;

    return Path()
      ..moveTo(left, bottom)
      ..conicTo(left + offset, bottom - offset, left + offset,
          bottom - 2 * radius, weight)
      ..lineTo(left + offset, top + radius)
      ..conicTo(left + offset, top, left + offset + radius, top, weight)
      ..lineTo(right - radius, top)
      ..conicTo(right, top, right, top + radius, weight)
      ..lineTo(right, bottom - radius)
      ..conicTo(right, bottom, right - radius, bottom, weight)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(getInnerPath(rect), Paint()..color = side.color);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return this;
  }
}
