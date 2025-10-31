// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categoryApiService)
const categoryApiServiceProvider = CategoryApiServiceProvider._();

final class CategoryApiServiceProvider
    extends
        $FunctionalProvider<
          CategoryApiClient,
          CategoryApiClient,
          CategoryApiClient
        >
    with $Provider<CategoryApiClient> {
  const CategoryApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryApiServiceHash();

  @$internal
  @override
  $ProviderElement<CategoryApiClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategoryApiClient create(Ref ref) {
    return categoryApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryApiClient>(value),
    );
  }
}

String _$categoryApiServiceHash() =>
    r'5cd87a69830f3dc2e3b855648407aee83402a3ef';
