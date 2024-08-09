// 문제 1
// 변수 선언 및 데이터 타입: 다음 코드에서 변수들의 데이터 타입을 적절하게 선언하고 값을 할당하세요. 또한, 각 변수에 대한 주석을 작성하세요.
/*
int number;
String message;
double decimal;
bool isAdult;
List<String> names;
 */
// void main() {
//   int number = 10;
//   String message = "쉽다";
//   double decimal = 3.14;
//   bool isAdult = false;
//   List<String> names = ['A', 'B', 'C'];
//
//   int? integer;
//
//   integer ??= 0;
//   // print(integer);
//
//   integer = 4.5.round();
//
//   print(integer);
// }


// 문제 2
// 다음 문제를 해결 할 수 있도록 코드를 기입하세요
/*
변수 a에 10, b에 5를 할당합니다.
a와 b의 합, 차, 곱, 나눗셈 결과를 새로운 변수에 저장하고 출력합니다.
나눗셈 결과는 소수점 두자리까지 표시합니다.
 */

// void main() {
//   int a = 10;
//   int b = 5;
//
//   num add = a + b;
//   num sub = a - b;
//   num mul = a * b;
//   num mod = a % b;
//   num div = a / b;
//
//   print(add);
//   print(sub);
//   print(mul);
//   print(mod);
//   print(div);
// }

// 문제 3
// 다음 문제를 해결 할 수 있도록 코드를 기입 하세요.

/*
calculateArea(width, height)라는 함수를 작성하여 사각형의 넓이를 계산합니다.
함수는 두 개의 매개변수 width와 height를 받아야 합니다.
함수는 넓이를 반환해야 합니다.
main 함수에서 calculateArea 함수를 호출하여 넓이를 계산하고 출력합니다.
 */

// void main() {
//   double calculateArea(double width, double height) {
//     return width * height;
//   }
//
//   print(calculateArea(10, 5));
// }

// 문제 4
// 다음 문제를 해결 할 수 있도록 코드를 기입 하세요.
/*
학생들의 이름을 저장하는 리스트를 만듭니다.
사용자로부터 학생들의 이름을 입력받아 리스트에 추가합니다.
리스트에 저장된 모든 학생들의 이름을 출력합니다.
 */
// import 'dart:io';
//
// void main() {
//   print('입력할 학생의 이름을 입력하세요 (종료를 희망한다면 X를 입력하세요) > \n');
//
//   List<String> students = [];
//
//   while(true) {
//     final user = stdin.readLineSync();
//
//     if (user?.toLowerCase().trim() == 'x' || user == null)  {
//       print('프로그램을 종료합니다.');
//       break;
//     }
//     students.add(user);
//   }
//
//   print(students);
// }

// 문제 5
// 다음 문제를 해결 할 수 있도록 코드를 기입 하세요.
/// "동물 클래스를 만들고 "말", "소", "돼지", 클래스를 "동물" 클래스를 상속받도록 설계하세요.
/// 각 동물 클래스마다 고유한 메서드 (말: 울음소리 내기, 소: 울음소리내기, 돼지: 꽥꽥 움을소리 내기)를 정의하세요.
/// 각 동물 객체를 생성하고 고유한 메서드를 호출하여 동작을 확인합니다.

abstract class Animal {
  void speak();
}

mixin Runnable {
  void run() {}
}

mixin Flyable {
  void fly() {}
}

class Horse extends Animal with Runnable {
  @override
  void speak() {
    print('이힝힝힝');
  }

  @override
  void run() {
    print('빠르게 달린다');
  }
}

class Cow extends Animal with Runnable {
  @override
  void speak() {
    print('음메에에에');
  }

  @override
  void run() {
    print('뚜벅뚜벅');
  }
}
class Pig extends Animal with Runnable {
  @override
  void speak() {
    print('꿀꿀꿀');
  }

  @override
  void run() {
    print('뚜벅뚜벅');
  }
}

class Chicken extends Animal with Flyable, Runnable {
  @override
  void speak() {
    print('꼬끼오');
  }

  @override
  void fly() {
    print('닭은 날 수 없어요');
  }

  @override
  void run() {
    print('우다닭');
  }
}

void main() {
  final animals = <Animal>[Horse(), Cow(), Pig(), Chicken()];
  for (final animal in animals) {
    animal.speak();

    if (animal is Runnable) {
      (animal as Runnable).run();
    }

    if (animal is Flyable) {
      (animal as Flyable).fly();
    }
  }
}