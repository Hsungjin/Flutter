// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fech_home_projects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchHomeProjects)
const fetchHomeProjectsProvider = FetchHomeProjectsProvider._();

final class FetchHomeProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HomeEntity>>,
          List<HomeEntity>,
          FutureOr<List<HomeEntity>>
        >
    with $FutureModifier<List<HomeEntity>>, $FutureProvider<List<HomeEntity>> {
  const FetchHomeProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHomeProjectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHomeProjectsHash();

  @$internal
  @override
  $FutureProviderElement<List<HomeEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HomeEntity>> create(Ref ref) {
    return fetchHomeProjects(ref);
  }
}

String _$fetchHomeProjectsHash() => r'cd523a41089220295f6b0e59d9cb0cd9687ca1b2';
