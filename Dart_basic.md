# What is Dart?
Dart 는 고급 프로그래밍 언어이다.

## 컴파일러 두가지 를 보유한고 있는 특징이 있음.
### JIT Compiler(Just In Time)
코드 실행 시점에 컴파일을 수행할 수 있는 컴파일러로, 빠른 개발과 디버깅을 할때 주로 사용되는 컴파일러
Flutter 개발의 특징인 Hot-Reload / Hot-Restart를 구현할 때 활용

### AOT Compiler(Ahead Of Time)
사전에 미리 컴파일을 수행하여 높은 실행속도를 필요로 할때 활용되는 컴파일러
코드 내부를 보호할 수 있으며, Dart 코드를 다른 플랫폼에서 실핼 할 수 있도록 커파일 후 배포 가능한 바이너리 파일을 생성하는 것이 특징
한마디로 개발이 완료되어 배포되기 위해서 사용하는 컴파일러

### 변수, 상수, 타입
var - 최초 한번 부여된 타입이 고정적으로사용
Dynamic - 타입이 코드 진행 중에라도 언제든 변환
const - complie 시점에 상수 처리 될 경우에 활용
final - 프로그램의 진행 중에 상수 처리 될 경우에 활용

```dart
void main() {
  // 참 / 거짓형 bool
  bool isTrue = true;
  
  // 정수형 int
  int num = 100;
  
  // 실수형 double
  double num1 = 3.14;
  double num2 = 3;
  
  // 문자열 String
  String string = 'Hello World';
  
  // Null 형 null
  Null thisIsNull = null;
  
  print(isTrue);
  print(num);
  print(num1);
  print(num2);
  print(string);
  print(thisIsNull);
  
  // 가변형 var / dynamic
  var value = 1;
  value = 2;
  print(value);
  
  dynamic dynamicValue = 100;
  dynamicValue = 'Hello';
  
  print(dynamicValue);
}
```

### 연산자
```dart
void main() {
  // 연산자
  // 산술 연산자
  // 사칙 연산(+, -, *, /)
  int num1 = 10;
  int num2 = 20;

  print(num1 + num2);
  print(num1 - num2);
  print(num1 * num2);
  print(num1 / num2);

  int num3;
  num3 = num1 + num2;
  print(num3);

  String str1 = 'Hello';
  String str2 = str1 + ' World';
  print(str2);
  String str3 = '$str2 World';
  print(str3);

  print('------------------------------');
  // 비교 연산자
  print(num1 == num2);
  print(num1 != num2);
  print(num1 >= num2);
  print(num1 < num2);

  print('------------------------------');
  // 논리 연산자 (&&(and), ||(or))
  bool bool1 = true;
  bool bool2 = false;

  print(bool1 && bool2);
  print(bool1 || bool2);
  print(bool1 && (num1 == num2));
  print(!bool1);

  print('------------------------------');
  // 삼항 연산자 (논리연산 ? 참일경우 : 거짓일경우)
  String answer = 10 <= 20 ? '10이 20보다 작습니다.' : '10이 20보다 큽니다';
  print(answer);

  print('------------------------------');
  // 할당 연산자 (=, +=, -=)
  num1 += 20;
  print(num1);

  num1 -= 20;
  print(num1);

  print('------------------------------');
  // Null 처리 연산자
  int? num4;
  int num5 = 10;

  print((num4 ?? 0) + num5);
}
```

### 클래스
- 클래스는 일종의 객체를 만들기 위한 템플릿
- 클래스를 활용하면 일종의 데이터와 코드를 그룹화해서 관련 코드를 같이 유지하고, 객체를 쉽게 만들어 객체지향 프로그래밍을 효과적으로 활용할 수 있음

#### Class의 구성요소
- 필드 : 클래스 내부에 선언된 데이터 ( 변수 / 상수 등)
- 메서드 : 클래스 내부에 선언 된 기능 ( 함수 )
- 생성자 : 클래스 인스턴스를 생성할 때 사용되는 코드, 생성 시 특정 작업을 지시하는 등의 활용이 가능

### 생성자 Constructor
- 클래스의 인스턴스를 생성하는데 사용되는 코드
- 생성자를 통해 매개변수를 전달하거나 클래스 내 필드의 초기값을 설정하는 등의 작업을 할 수 있음.

#### 생성자의 종류
- Default constructors : 기본 생성자로, 생성자를 선언하지 않을 경우 제공되는 생성자.
- Named constructors : 개발자가 필요에 의해 생성한 생성자로, 클래스에 대한 여러 생성자를 구현하거나 추가적인 클래스의 명확성을 제공
- Redirecting constructors : 목적이 동일한 생성자로 전달하기 위한 생성자로, 생성자의 본문은 비어 있지만, 전달 된 생성자에 대한 초기값 등을 구현할 때 활용
- Const constructors : 상수 생성자로, 클래스가 불변의 객체를 생성하는 경우 활용
- Factory constructors :  매번 새로운 인스턴스를 만들지 않는 생성자를 활용할 때 사용, 이미 존재하는 인스턴스를 반환하거나, 단순한 초기값을 부여가 아닌 연산이 필요한 객체 생성 시 활용

```dart
void main() {
  Point point = Point(1, 2);
  print(point);
  print(point.x);
  print(point.y);

  Point aPoint = Point(2, 5);
  Point bPoint = Point(10, 4);

  print(aPoint.x);
  print(aPoint.y);

  print(bPoint.x);
  print(bPoint.y);
}

// 클래스
// 클래스 기초
// 명명 생성자
class Point {
  double x;
  double y;

  Point(this.x, this.y);
}
```

### 함수 / 메서드

```dart
void main() {
  // 함수 / 메서드
  // 프그래밍에서 가장 기본이 되는 단위 중 하나.
  // 동작에 대한 단위
  //
  // 리턴 타입 함수명 (매개변수) {
  //   함수내 동작 할 코드
  // }
  int num1 = 10;
  int num2 = 20;

  int sum = add(num1, num2);

  print(sum);
}

int add(int num1, int num2) {
  return num1 + num2;
}
```

### 분기문과 반복문

```dart
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
```


### 예외처리

```dart
void main() {
  /// 예외처리 : 프로그램이 진행 중 일때, 의도하였거나 의도하지 않은 상황에 대해서
  /// 프로그램적으로 오류가 발생했을 때, 대처하는 방법.
  /// try - catch : 가장 기본적인 예외처리문 / 많이 쓰이는 예외처리 문이기도 함.
  /// finally
  /// on
  /// throw / rethrow

  int num1 = 10;
  try {
    // 예외가 발생할 것으로 예상되는 코드
    print(10 ~/ 0);
  } catch (error, stack) {
    /// 에외가 발생했을 때 실행하고자 하는 코드
    print(error);
    print(stack);
  } finally {
    // 예외가 발생 했던, 하지 않았던, try 문 / catch 문 이후에 실행하고자 하는 코드
    print("예외처리 문을 지나쳤습니다.");
  }

  try {
    print(10 ~/ 0);
  } on UnsupportedError catch (error, stack) {
    print('여기는 on 관련 에러 처리');
    print('~/ 해당 연산자는 0 으로 나눌 수 없습니다.');
  } on TypeError catch (error, stack) {
    print('Null 값이 감지되었습니다.');
  } catch (error, stack) {
    print('모르는 에러가 발생했습니다.');
  }

  try {
    throw Exception('Unknown Error');
  } catch (error, stack) {
    print('throw 관련 에러처리 문');
    // rethrow;
  }

  print(num1 ~/ 3);
}

```

### 비동기 프로그래밍

```dart
void main() {
  /// 비동기 프로그래밍
  /// 동기성 / 비동기성
  /// 동기 : 모든 코드가 순차적으로 진행되는 형태
  /// 비동기 : 코드가 동시다발적으로 실행돼서, 순차적으로 보장하지않는 형태

  /// async / await / Future : 1회만 응답을 돌려받는 경우
  Future<void> todo(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
    print('TODO Done in $seconds seconds');
  }

  todo(3);
  todo(1);
  todo(5);

  /// async* / yield / Stream : 지속적으로 응답을 돌려받는 경우
  Stream<int> todo2() async* {
    int counter = 0;

    while (counter <= 10) {
      counter++;
      await Future.delayed(Duration(seconds: 1));
      print('TODO is Running $counter');
      yield counter;
    }

    print('TODO is Done');
  }

  todo2().listen((event) {});
}
```
