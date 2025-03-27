// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewModuleModel _$ViewModuleModelFromJson(Map<String, dynamic> json) =>
    _ViewModuleModel(
      type: json['type'] as String,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ViewModuleModelToJson(_ViewModuleModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'imageUrl': instance.imageUrl,
    };
