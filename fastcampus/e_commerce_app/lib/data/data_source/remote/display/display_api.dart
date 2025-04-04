import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../dto/common/response_wrapper.dart';
import '../../../dto/display/display_dto.dart';

part 'display_api.g.dart';

@RestApi()
abstract class DisplayApi {
  factory DisplayApi(Dio dio, {String baseUrl}) = _DisplayApi;

  @GET('/api/menus/{mall_type}')
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(
      @Path('mall_type') String mallType);

  @GET('/api/view_modules/{tab_id}')
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
      @Path('tab_id') int tabId);
}
