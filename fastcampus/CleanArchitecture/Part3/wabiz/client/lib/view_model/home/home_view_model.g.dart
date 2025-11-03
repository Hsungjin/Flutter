// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewModel)
const homeViewModelProvider = HomeViewModelProvider._();

final class HomeViewModelProvider
    extends $NotifierProvider<HomeViewModel, HomeState?> {
  const HomeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @$internal
  @override
  HomeViewModel create() => HomeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeState?>(value),
    );
  }
}

String _$homeViewModelHash() => r'0df37645a5dee137d0c56b0506fd2f34ff1d964a';

abstract class _$HomeViewModel extends $Notifier<HomeState?> {
  HomeState? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeState?, HomeState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeState?, HomeState?>,
              HomeState?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(fetchHomeProject)
const fetchHomeProjectProvider = FetchHomeProjectProvider._();

final class FetchHomeProjectProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeModel>,
          HomeModel,
          FutureOr<HomeModel>
        >
    with $FutureModifier<HomeModel>, $FutureProvider<HomeModel> {
  const FetchHomeProjectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHomeProjectProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHomeProjectHash();

  @$internal
  @override
  $FutureProviderElement<HomeModel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeModel> create(Ref ref) {
    return fetchHomeProject(ref);
  }
}

String _$fetchHomeProjectHash() => r'f282b5414c2aa2bbdc7a92a0e39da5bc9fe2f1ac';

@ProviderFor(fetchHomeCategories)
const fetchHomeCategoriesProvider = FetchHomeCategoriesProvider._();

final class FetchHomeCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProjectCategory>>,
          List<ProjectCategory>,
          FutureOr<List<ProjectCategory>>
        >
    with
        $FutureModifier<List<ProjectCategory>>,
        $FutureProvider<List<ProjectCategory>> {
  const FetchHomeCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHomeCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHomeCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<ProjectCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProjectCategory>> create(Ref ref) {
    return fetchHomeCategories(ref);
  }
}

String _$fetchHomeCategoriesHash() =>
    r'6fa75545b4eec2b9162015c3a65e151f3380ea15';
