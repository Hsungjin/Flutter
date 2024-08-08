// 문제 1
// 변수 선언 및 데이터 타입: 다음 코드에서 변수들의 데이터 타입을 적절하게 선언하고 값을 할당하세요. 또한, 각 변수에 대한 주석을 작성하세요.
/*
int number;
String message;
double decimal;
bool isAdult;
List<String> names;
 */
void main() {
  int number = 10;
  String message = "쉽다";
  double decimal = 3.14;
  bool isAdult = false;
  List<String> names = ['A', 'B', 'C'];

  int? integer;

  integer ??= 0;
  print(integer);
}