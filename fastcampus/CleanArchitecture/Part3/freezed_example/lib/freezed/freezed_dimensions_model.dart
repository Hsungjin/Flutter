import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_dimensions_model.freezed.dart';
part 'freezed_dimensions_model.g.dart';

@freezed
abstract class FreezedDimensionsModel with _$FreezedDimensionsModel {
  const factory FreezedDimensionsModel({
    double? width,
    double? height,
    double? depth,
  }) = _FreezedDimensionsModel;

  factory FreezedDimensionsModel.fromJson(Map<String, Object?> json) =>
      _$FreezedDimensionsModelFromJson(json);
}
