
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
