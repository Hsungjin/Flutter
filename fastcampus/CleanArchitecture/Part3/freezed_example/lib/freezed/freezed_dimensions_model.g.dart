// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_dimensions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FreezedDimensionsModel _$FreezedDimensionsModelFromJson(
  Map<String, dynamic> json,
) => _FreezedDimensionsModel(
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  depth: (json['depth'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FreezedDimensionsModelToJson(
  _FreezedDimensionsModel instance,
) => <String, dynamic>{
  'width': instance.width,
  'height': instance.height,
  'depth': instance.depth,
};
