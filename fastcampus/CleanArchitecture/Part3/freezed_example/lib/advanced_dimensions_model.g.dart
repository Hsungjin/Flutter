// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced_dimensions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvancedDimensionsModel _$AdvancedDimensionsModelFromJson(
  Map<String, dynamic> json,
) => AdvancedDimensionsModel(
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  depth: (json['depth'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AdvancedDimensionsModelToJson(
  AdvancedDimensionsModel instance,
) => <String, dynamic>{
  'width': instance.width,
  'height': instance.height,
  'depth': instance.depth,
};
