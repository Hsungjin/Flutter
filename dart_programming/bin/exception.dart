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
