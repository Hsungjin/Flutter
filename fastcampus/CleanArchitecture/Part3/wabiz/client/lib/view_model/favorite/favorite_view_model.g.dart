// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteViewModel)
const favoriteViewModelProvider = FavoriteViewModelProvider._();

final class FavoriteViewModelProvider
    extends $NotifierProvider<FavoriteViewModel, CategoryModel> {
  const FavoriteViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteViewModelHash();

  @$internal
  @override
  FavoriteViewModel create() => FavoriteViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryModel>(value),
    );
  }
}

String _$favoriteViewModelHash() => r'6578c5cc0cc2808957e11cf8b091b0de2c2171d6';

abstract class _$FavoriteViewModel extends $Notifier<CategoryModel> {
  CategoryModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CategoryModel, CategoryModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryModel, CategoryModel>,
              CategoryModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
