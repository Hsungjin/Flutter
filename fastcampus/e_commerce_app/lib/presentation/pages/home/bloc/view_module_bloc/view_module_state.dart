part of 'view_module_bloc.dart';

@freezed
abstract class ViewModuleState with _$ViewModuleState {
  factory ViewModuleState({
    @Default(Status.initial) Status status,
    @Default(-1) int tabId,
    @Default(<ViewModuleModel>[]) List<ViewModuleModel> viewModules,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _ViewModuleState;
}