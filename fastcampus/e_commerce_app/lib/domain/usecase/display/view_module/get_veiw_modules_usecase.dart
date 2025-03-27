import '../../../../core/utils/error/error_response.dart';
import '../../../model/common/result.dart';
import '../../../model/display/view_module/view_module_model.dart';
import '../../../repository/display_repository.dart';
import '../../base/remote_usecase.dart';

class GetViewModulesUsecase extends RemoteUsecase<DisplayRepository> {
  final int tabId;

  GetViewModulesUsecase({required this.tabId});

  @override
  Future<Result<List<ViewModuleModel>>> call(DisplayRepository repository) async {
    final result = await repository.getViewModulesByTabId(tabId: tabId);

    return result.status == 'SUCCESS'
        ? Result.success(result.data ?? [])
        : Result.error(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}