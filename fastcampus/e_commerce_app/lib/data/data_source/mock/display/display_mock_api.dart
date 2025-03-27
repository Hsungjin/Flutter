import 'dart:convert';
import 'dart:io';

import '../../../dto/common/response_wrapper.dart';
import '../../../dto/display/display_dto.dart';
import '../../../dto/display/menu/menu_dto.dart';
import '../../remote/display/display_api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: _menuParser(mallType == 'market'
            ? DisplayMockData.menusByMarket
            : DisplayMockData.menusByBeauty),
      ),
    );
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
      int tabId) {
    late String source;
    final endOfTabId = tabId % 10;

    switch (endOfTabId) {
      case 1:
        source = DisplayMockData.viewModulesByTabIdCaseOne;
        break;
      case 2:
        source = DisplayMockData.viewModulesByTabIdCaseTwo;
        break;
      case 3:
        source = DisplayMockData.viewModulesByTabIdCaseThree;
        break;
      case 4:
        source = DisplayMockData.viewModulesByTabIdCaseFour;
        break;
      case 5:
        source = DisplayMockData.viewModulesByTabIdCaseFive;
        break;
    }

    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: _viewModuleParser(source),
      ),
    );
  }

  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }

  List<ViewModuleDto> _viewModuleParser(String source) {
    List<ViewModuleDto> viewModules = [];
    final List json = jsonDecode(source);
    viewModules = json.map((e) => ViewModuleDto.fromJson(e)).toList();

    return viewModules;
  }
}
