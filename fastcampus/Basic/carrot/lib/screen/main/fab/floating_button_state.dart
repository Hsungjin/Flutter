import 'package:freezed_annotation/freezed_annotation.dart';

part 'floating_button_state.freezed.dart';

@freezed
class FloatingButtonState with _$FloatingButtonState {
  const factory FloatingButtonState({
    required bool isExpanded,
    required bool isSmall,
  }) = _FloatingButtonState;
}