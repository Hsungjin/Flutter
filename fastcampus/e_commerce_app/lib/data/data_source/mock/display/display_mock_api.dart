import 'dart:convert';

import '../../../dto/common/response_wrapper.dart';
import '../../../dto/display/menu/menu_dto.dart';
import '../../remote/display/display_api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    return Future(() => ResponseWrapper(
        status: 'success',
        code: '0000',
        message: '',
        data: _menuParser(mallType == 'market'
            ? DisplayMockData.menusByMarket
            : DisplayMockData.menusByBeauty)));
  }

  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }
}
