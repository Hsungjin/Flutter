import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/error/error_response.dart';
import '../../../../../core/utils/exception/common_exception.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/view_module/view_module_model.dart';
import '../../../../../domain/usecase/display/display_usecase.dart';
import '../../../../../domain/usecase/display/view_module/get_veiw_modules_usecase.dart';

part 'view_module_event.dart';
part 'view_module_state.dart';

part 'view_module_bloc.freezed.dart';

class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc(this._displayUsecase) : super(ViewModuleState()) {
    on<ViewModuleInitialized>(_onViewModuleInitialized);
  }

  Future<void> _onViewModuleInitialized(ViewModuleInitialized event, Emitter<ViewModuleState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final tabId = event.tabId;
    try {
      final response = await _fetch(tabId);
      if (response is Success<List<ViewModuleModel>>) {
        emit(state.copyWith(status: Status.success, viewModules: response.data));
      } else if (response is Error) {
        emit(state.copyWith(status: Status.error, error: CommonException.setError(response)));
      }
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.error, error: CommonException.setError(error)));
    }
  }

  Future<Result<List<ViewModuleModel>>> _fetch(int tabId) async {
    return await _displayUsecase.execute(usecase: GetViewModulesUsecase(tabId: tabId));
  }
}