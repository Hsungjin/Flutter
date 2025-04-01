import '../../repository/display_repository.dart';
import '../base/remote_usecase.dart';

class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase(this._displayRepository);

  Future execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_displayRepository);
  }
}
