// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeProvider)
const homeProviderProvider = HomeProviderProvider._();

final class HomeProviderProvider
    extends $AsyncNotifierProvider<HomeProvider, HomeProviderState> {
  const HomeProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeProviderHash();

  @$internal
  @override
  HomeProvider create() => HomeProvider();
}

String _$homeProviderHash() => r'067c1248bde2a2971161c668bfc071e9d9425977';

abstract class _$HomeProvider extends $AsyncNotifier<HomeProviderState> {
  FutureOr<HomeProviderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<HomeProviderState>, HomeProviderState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeProviderState>, HomeProviderState>,
              AsyncValue<HomeProviderState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
