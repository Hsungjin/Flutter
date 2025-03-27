import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_module_dto.freezed.dart';
part 'view_module_dto.g.dart';

@freezed
abstract class ViewModuleDto with _$ViewModuleDto {
  const factory ViewModuleDto({
    @Default('') String type,
    @Default('') String title,
    @Default('') String subTitle,
    @Default('') String imageUrl,
  }) = _ViewModuleDto;

  factory ViewModuleDto.fromJson(Map<String, dynamic> json) => _$ViewModuleDtoFromJson(json);
}