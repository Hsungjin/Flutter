import 'dart:io';

import 'package:e_commerce_app/data/data_source/mock/display/display_mock_api.dart';
import 'package:e_commerce_app/data/data_source/remote/display/display_api.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper.dart';
import 'package:e_commerce_app/data/dto/display/menu/menu_dto.dart';
import 'package:e_commerce_app/data/mapper/common_mapper.dart';
import 'package:e_commerce_app/data/mapper/dispalay_mapper.dart';
import 'package:e_commerce_app/data/repository_impl/dispaly_repository_impl.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu_model.dart';
import 'package:e_commerce_app/domain/repository/display_repository.dart';
import 'package:e_commerce_app/presentation/main/cubit/mall_type_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDisplayApi extends Mock implements DisplayApi {

}

void main() {
  late DisplayRepository displayRepository;
  late DisplayApi displayApi;

  setUpAll(() {
    displayApi = MockDisplayApi();
    displayRepository = DisplayRepositoryImpl(displayApi);
  });

  test('의존성 주입 및 객체 생성 완료', () => expect(displayRepository, isNotNull));

  group('메뉴 리스트 불러오기', () {
    // api 호출 성공
    test('api 호출 성공', () async {
      try {
        await displayRepository.getMenusByMallType(mallType: MallType.market);
      } catch (_) {
        verify(() => displayApi.getMenusByMallType(any())).called(1);
      }
    });

    // api 호출 실패
    test('api 호출 실패', () async {
      final exception = SocketException('error');

      when(() => displayApi.getMenusByMallType(any())).thenThrow(exception);

      expect(() => displayRepository.getMenusByMallType(mallType: MallType.market), throwsA(isA<SocketException>()));
    });

    test('api 호출 성곡적으로 불러옴', () async {
      final MallType mallType = MallType.market;
      final ResponseWrapper<List<MenuDto>> mockingData = await DisplayMockApi().getMenusByMallType(mallType.name);

      when(() => displayApi.getMenusByMallType(any())).thenAnswer((_) async => mockingData);

      final actual = await displayRepository.getMenusByMallType(mallType: mallType);
      final expected = mockingData.toModel<List<MenuModel>>(mockingData.data?.map((menuDto) => menuDto.toModel()).toList() ?? []);

      expect(actual, expected);

    });
  });
}