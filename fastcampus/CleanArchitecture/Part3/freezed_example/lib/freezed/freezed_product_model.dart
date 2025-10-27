import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_example/freezed/freezed_dimensions_model.dart';

part 'freezed_product_model.freezed.dart';
part 'freezed_product_model.g.dart';

@freezed
abstract class FreezedProductModel with _$FreezedProductModel {
  const factory FreezedProductModel({
    int? id,
    String? title,
    String? description,
    String? category,
    num? price,
    num? discountPercentage,
    num? rating,
    int? stock,
    List<dynamic>? tags,
    FreezedDimensionsModel? dimensions,
  }) = _FreezedProductModel;

  factory FreezedProductModel.fromJson(Map<String, Object?> json) =>
      _$FreezedProductModelFromJson(json);
}
