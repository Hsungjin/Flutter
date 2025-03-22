import 'package:retrofit/retrofit.dart';

import '../dto/common/response_wrapper.dart';

extension ResponseWrapperX on ResponseWrapper {
  ResponseWrapper<T> toModel<T>(T data) {
    return ResponseWrapper<T>(
      status: status,
      code: code,
      message: message,
      data: data,
    );
  }
}
