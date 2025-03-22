import '../../data/data_source/remote/display/display_api.dart';
import '../../domain/model/display/menu/menu_model.dart';
import '../../domain/repository/display_repository.dart';
import '../../presentation/main/cubit/mall_type_cubit.dart';
import '../dto/common/response_wrapper.dart';
import '../mapper/common_mapper.dart';
import '../mapper/dispalay_mapper.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  DisplayRepositoryImpl(this._displayApi);

  @override
  Future<ResponseWrapper<List<MenuModel>>> getMenusByMallType({required MallType mallType}) async {
    final response = await _displayApi.getMenusByMallType(mallType.name);
    return response.toModel<List<MenuModel>>(response.data?.map((dto) => dto.toModel()).toList() ?? []);
  }
}
