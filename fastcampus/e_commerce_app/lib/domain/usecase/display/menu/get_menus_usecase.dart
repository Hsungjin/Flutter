import '../../../../core/utils/constant.dart';
import '../../../../core/utils/error/error_response.dart';
import '../../../model/common/result.dart';
import '../../../repository/display_repository.dart';
import '../../base/remote_usecase.dart';

class GetMenusUsecase extends RemoteUsecase<DisplayRepository> {
  final MallType mallType;

  GetMenusUsecase(this.mallType);

  @override
  Future call(DisplayRepository repository) async {
    final result = await repository.getMenusByMallType(mallType: mallType);

    return result.status == 'SUCCESS'
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}
