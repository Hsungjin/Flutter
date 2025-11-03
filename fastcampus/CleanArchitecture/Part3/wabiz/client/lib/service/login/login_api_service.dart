import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:client/service/login/login_api.dart';
import 'package:client/shared/network_provider.dart';
import 'package:flutter/foundation.dart';

part 'login_api_service.g.dart';

@Riverpod(keepAlive: true)
LoginApiClient loginApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  var localhost = "localhost";

  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }

  return LoginApiClient(dio, baseUrl: 'http://$localhost:3000/api/v1/');
}
