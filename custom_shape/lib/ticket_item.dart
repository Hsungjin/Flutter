import 'package:flutter/material.dart';

class TicketItem extends StatefulWidget {
  final Widget topChild;
  final Widget bottomChild;

  const TicketItem({super.key, required this.topChild, required this.bottomChild});

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  final notchKey = GlobalKey();
  RenderBox? notchBox;
  RenderBox? ancestorBox;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        notchBox = notchKey.currentContext?.findRenderObject() as RenderBox?;
        ancestorBox = context.findRenderObject() as RenderBox?;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // notchBox와 ancestorBox가 null이면 빈 Container를 반환
    if (notchBox == null || ancestorBox == null) {
      return Container(); // 혹은 로딩 인디케이터
    }
    return ClipPath(
      clipper: _TicketClipper(
        notchBox: notchBox!,
        ancestorBox: ancestorBox!,
      ),
      child: ColoredBox(
        color: Color(0xFFd6f5ff),
        child: Column(
          children: [
            widget.topChild,
            SizedBox(key: notchKey, height: 20),
            widget.bottomChild,
          ],
        ),
      ),
    );
  }
}

class _TicketClipper extends CustomClipper<Path> {
  final RenderBox notchBox;
  final RenderBox ancestorBox;

  _TicketClipper({required this.notchBox, required this.ancestorBox});

  @override
  Path getClip(Size size) {
    final widgetRect = RRect.fromRectAndRadius(
      Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
      const Radius.circular(10),
    );

    final notch = notchBox.localToGlobal(Offset.zero, ancestor: ancestorBox);

    return Path.combine(
      PathOperation.difference,
      Path()..addRRect(widgetRect),
      Path()
        ..addOval(Rect.fromCenter(
            center: Offset(0, notch.dy + 10), width: 20, height: 20))
        ..addOval(Rect.fromCenter(
            center: Offset(size.width, notch.dy + 10), width: 20, height: 20)),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}