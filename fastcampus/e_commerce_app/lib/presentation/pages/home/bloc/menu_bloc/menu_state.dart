part of 'menu_bloc.dart';

@freezed
abstract class MenuState with _$MenuState {
  factory MenuState({
    @Default(Status.initial) Status status,
    @Default([]) List<MenuModel> menus,
    String? errorMessage,
  }) = _MenuState;
}
