// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginApiService)
const loginApiServiceProvider = LoginApiServiceProvider._();

final class LoginApiServiceProvider
    extends $FunctionalProvider<LoginApiClient, LoginApiClient, LoginApiClient>
    with $Provider<LoginApiClient> {
  const LoginApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginApiServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginApiServiceHash();

  @$internal
  @override
  $ProviderElement<LoginApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginApiClient create(Ref ref) {
    return loginApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginApiClient>(value),
    );
  }
}

String _$loginApiServiceHash() => r'28edf99d4bbf243ba5bc63a5c71c67761e26a122';
