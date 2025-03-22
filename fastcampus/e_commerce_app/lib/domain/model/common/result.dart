import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/error/error_response.dart';

part 'result.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class Result<T> with _$Result<T> {
  factory Result.success(T data) = Success;

  factory Result.error(ErrorResponse error) = Error;
}
