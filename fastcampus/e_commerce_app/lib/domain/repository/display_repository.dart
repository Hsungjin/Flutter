import '../../core/utils/constant.dart';
import '../../data/dto/common/response_wrapper.dart';
import '../model/display/display_model.dart';
import 'repository.dart';

abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<MenuModel>>> getMenusByMallType({required MallType mallType});

  Future<ResponseWrapper<List<ViewModuleModel>>> getViewModulesByTabId({required int tabId});
}
