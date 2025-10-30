// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeApiService)
const homeApiServiceProvider = HomeApiServiceProvider._();

final class HomeApiServiceProvider
    extends $FunctionalProvider<HomeApi, HomeApi, HomeApi>
    with $Provider<HomeApi> {
  const HomeApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeApiServiceHash();

  @$internal
  @override
  $ProviderElement<HomeApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeApi create(Ref ref) {
    return homeApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeApi>(value),
    );
  }
}

String _$homeApiServiceHash() => r'75baa4fa6df85c5c9eb9384d093ddf147711743c';
