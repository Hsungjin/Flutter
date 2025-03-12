import 'package:freezed_annotation/freezed_annotation.dart';

part 'w_floating_carrot_button.state.freezed.dart';
part 'w_floating_carrot_button.state.g.dart';

@freezed
class FloatingButtonState with _$FloatingButtonState {
  const factory FloatingButtonState({
    final bool isExpanded,
    final bool isSmall,
  }) = _FloatingButtonState;
}

