import 'package:e_commerce_app/core/utils/error/error_response.dart';
import 'package:e_commerce_app/data/data_source/remote/display/display_api.dart';
import 'package:e_commerce_app/data/repository_impl/dispaly_repository_impl.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu_model.dart';
import 'package:e_commerce_app/domain/repository/display_repository.dart';
import 'package:e_commerce_app/domain/usecase/display/display_usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/menu/get_menus_usecase.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDisplayApi extends Mock implements DisplayApi {}
class MockDisplayRepository extends Mock implements DisplayRepository {}
class MockGetMenusUsecase extends Mock implements GetMenusUsecase {}


void main() {
  late DisplayRepository displayRepository;
  late DisplayUsecase displayUsecase;

  setUpAll(() {
    displayRepository = DisplayRepositoryImpl(MockDisplayApi());
    displayUsecase = DisplayUsecase(displayRepository);
  });

  test('의존성 주입 성공', () {
    expect(displayUsecase, isNotNull);
  });

  test('메뉴 리스트 불러오기 성공', () async {
    final result = Result.success([MenuModel(tabId: -1, title: '메뉴테스트')]);
    final usecase = MockGetMenusUsecase();

    when(() => usecase.mallType).thenReturn(MallType.market);
    when(() => usecase.call(displayRepository)).thenAnswer((_) async => result);

    final actual = await displayUsecase.execute(usecase: usecase);

    expect(actual, result);
  });

    test('메뉴 리스트 불러오기 실패', () async {
    final result = Result<List<MenuModel>>.error(ErrorResponse(message: 'error'));
    final usecase = MockGetMenusUsecase();

    when(() => usecase.mallType).thenReturn(MallType.market);
    when(() => usecase.call(displayRepository)).thenAnswer((_) async => result);

    final actual = await displayUsecase.execute(usecase: usecase);

    expect(actual, result);
  });
}