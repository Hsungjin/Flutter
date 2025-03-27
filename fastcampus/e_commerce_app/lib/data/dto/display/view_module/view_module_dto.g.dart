// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_module_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewModuleDto _$ViewModuleDtoFromJson(Map<String, dynamic> json) =>
    _ViewModuleDto(
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$ViewModuleDtoToJson(_ViewModuleDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'imageUrl': instance.imageUrl,
    };
