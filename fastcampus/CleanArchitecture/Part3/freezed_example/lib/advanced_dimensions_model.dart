import 'package:freezed_annotation/freezed_annotation.dart';

part 'advanced_dimensions_model.g.dart';

@JsonSerializable()
class AdvancedDimensionsModel {
  double? width;
  double? height;
  double? depth;

  AdvancedDimensionsModel({this.width, this.height, this.depth});

  factory AdvancedDimensionsModel.fromJson(Map<String, dynamic> json) {
    return _$AdvancedDimensionsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdvancedDimensionsModelToJson(this);
  }

  @override
  String toString() {
    return 'AdvancedDimensionsModel(width: $width, height: $height, depth: $depth)';
  }
}
