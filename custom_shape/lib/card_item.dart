import 'package:flutter/material.dart';

class CardItem extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double sideRadius = 30.0;
    double midPoint = size.height * (3 / 5);
    double cornerRadius = 20.0;

    // 1. A로 이동
    path.moveTo(0, cornerRadius);
    // 2. B까지 선을 그어준다
    path.lineTo(0, (midPoint - sideRadius));
    // 3. 제어점을 C로 잡고 D까지 곡선을 그려준다
    path.quadraticBezierTo(sideRadius, midPoint - sideRadius, sideRadius, midPoint);
    // 4. 제어점을 E로 잡고 F까지 곡선을 그려준다
    path.quadraticBezierTo(sideRadius, midPoint + sideRadius, 0, midPoint + sideRadius);
    // 5. G까지 선을 이어준다
    path.lineTo(0, size.height - cornerRadius);
    // 6. 제어점을 H로 잡고 I까지 곡선을 그려준다
    path.quadraticBezierTo(0, size.height, cornerRadius, size.height);
    // 7. J까지 선을 그어준다
    path.lineTo(size.width - cornerRadius, size.height);
    // 8. 제어점을 K로 잡고 L까지 곡선을 그려준다
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - cornerRadius);
    // 9. M까지 선을 그어준다
    path.lineTo(size.width, (midPoint + sideRadius));
    // 10. 제어점은 N으로 잡고 O까지 곡선을 그려준다
    path.quadraticBezierTo((size.width - sideRadius), (midPoint + sideRadius), (size.width - sideRadius), (midPoint));
    // 11.제어점을 P로 잡고 Q까지의 곡선을 그려준다
    path.quadraticBezierTo((size.width - sideRadius), (midPoint - sideRadius), size.width, midPoint - sideRadius);
    // 12. R까지 선을 그어준다
    path.lineTo(size.width, cornerRadius);
    // 13. 제어점은 S로 잡고 T까지의 곡선을 그려준다
    path.quadraticBezierTo(size.width, 0, size.width - cornerRadius, 0);
    // 14. U까지 가는 선을 그어준다
    path.lineTo(cornerRadius, 0);
    // 15. 제어점을 V로 잡고 A까지의 곡선을 그려준다
    path.quadraticBezierTo(0, 0, 0, cornerRadius);
    // 16. path를 close 해준다
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
