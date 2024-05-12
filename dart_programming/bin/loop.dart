void main() {
  // 분기문과 반복문
  // 분기문 : 프로그램이 특정한 상황에 일을 할지 / 하지 않고 넘길지
  // if / else || switch

  // if 문 / if - else 문
  // if(조건식) {
  //  조건이 참일 경우 실행 할 코드
  // }
  // else if(조건식2) {
  //  맨 처음 조건식이 거짓이지만, 조건식 2가 참일 경우 실행할 코드
  // } else {
  //  조건식이 거짓일 경우 실행할 코드
  // }

  bool isTrue = true;
  String text = 'Hello';
  bool trigger = 10 > 20;

  if (isTrue) {
    print("True");
  }

  if (text == 'Hello') {
    print("String True");
  }

  if (trigger) {
    print("Trigger True");
  } else {
    print('Trigger False');
  }

  int standard = 3;

  if (standard < 0) {
    print("여기는 찍히지 않은거에요.");
  } else if (standard == 3) {
    print("여기는 찍히겠죠");
  } else {
    print("모두 거짓입니다.");
  }

  /// switch 문
  /// Flutter 3.10 / Dart 3.0 버전 이상부터 변경 된 부분이 조금 있는 분법 중 하나
  /// 예시는 3.10 / 3.0 버전 기준으로 설명
  /// 중간 구버전(3.7 버전 이하)에서 사용하는 방법도 사용 예정
  ///
  /// switch (비교대상) {
  ///   case (조건식1) :
  ///   case (조건식2) :
  ///   case (조건식3) :
  ///   case (조건식4) :
  ///   default :
  /// }
  ///

  int num = 101;

  switch (num) {
    case 1:
      print("1");
    //break; 생략가능
    case 2:
      print("2");
      break;
    case 3:
      print("3");
      break;
    case 4:
      print("4");
      break;
    case 5:
      print("5");
      break;
    case > 100:
      print("Wow big number! $num");
    // Only Upper Dart 3.0
    default:
      print("default");
      break;
  }

  /// 반복문 : 특정한 코드의 반복을 컴퓨터에게 지시 할 때 사용하는 프로그래밍 문법
  /// for / for in / while / do - while
  /// continue / break
  ///
  /// for (기준 변수; 조건식; 가변치) {
  ///   조건식이 참 일 때 반복할 코드
  /// }
  ///
  for (int i = 0; i < 10; i++) {
    print('Running For Index $i');
  }

  /// for (단일 변수 in 컬렉션 (List / Set / Map)) {
  ///   컬렉션 내의 요소(Element)의 수 / 변수 만큼 사용 될 반복문
  /// }
  ///
  List<int> indexs = [0, 1, 2, 3, 4, 5];

  for (final index in indexs) {
    print('Running for in $index');
  }

  /// while (조건식) {
  ///   조선식이 참일 경우 반복될 내용
  /// }
  ///

  bool isRunning = true;
  int count = 0;

  while (isRunning) {
    if (count >= 5) {
      isRunning = false;
    }

    print('While is Running with $count');
    count += 1;
  }

  /// do - while
  /// do {
  ///   선행 진행 될 코드
  /// } while (조건);
  ///

  int num2 = 0;
  do {
    num2++;

    if (num2 == 4) {
      continue;
    }

    print('Running Do While $num2');
  } while (num2 < 10);
}
