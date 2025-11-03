import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'network_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  var localHost = 'localhost';
  if (defaultTargetPlatform == TargetPlatform.android) {
    localHost = '10.0.2.2';
  }

  final options = BaseOptions(
    baseUrl: "http://$localHost:3000/api/v1",
    responseType: ResponseType.json,
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    validateStatus: (status) {
      // 400 에러도 정상 응답으로 처리하여 에러 메시지를 받을 수 있도록 함
      return status != null && status < 500;
    },
  );

  return Dio(options);
}
