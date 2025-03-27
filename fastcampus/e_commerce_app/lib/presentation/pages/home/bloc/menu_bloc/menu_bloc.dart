import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/error/error_response.dart';
import '../../../../../core/utils/exception/common_exception.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/menu/menu_model.dart';
import '../../../../../domain/usecase/display/display_usecase.dart';
import '../../../../../domain/usecase/display/menu/get_menus_usecase.dart';
import '../../../../main/cubit/mall_type_cubit.dart';

part 'menu_event.dart';
part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUseCase;

  MenuBloc(this._displayUseCase) : super(MenuState()) {
    on<MenuInitialized>(_onMenuInitialized);
  }

  Future<void> _onMenuInitialized(MenuInitialized event, Emitter<MenuState> emit) async {
    final mallType = event.mallType;
    emit(state.copyWith(status: Status.loading));

    try {
      final Result<List<MenuModel>> response = await _fetch(mallType);
      if (response is Success<List<MenuModel>>) {
        emit(state.copyWith(status: Status.success, menus: response.data));
      } else if (response is Error) {
        emit(state.copyWith(status: Status.error));
      }
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.error, error: ErrorResponse(message: error.toString())));
    }
  }

  Future<Result<List<MenuModel>>> _fetch(MallType mallType) async {
    return await _displayUseCase.execute(usecase: GetMenusUsecase(mallType: mallType));
  }
}
