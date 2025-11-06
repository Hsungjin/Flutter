// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_home_categories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
