// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryViewModel)
const categoryViewModelProvider = CategoryViewModelProvider._();

final class CategoryViewModelProvider
    extends $NotifierProvider<CategoryViewModel, CategoryScreenState> {
  const CategoryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryViewModelHash();

  @$internal
  @override
  CategoryViewModel create() => CategoryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryScreenState>(value),
    );
  }
}

String _$categoryViewModelHash() => r'd5752d3baf8939bf9be2bc45f086aa944f1ee082';

abstract class _$CategoryViewModel extends $Notifier<CategoryScreenState> {
  CategoryScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CategoryScreenState, CategoryScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryScreenState, CategoryScreenState>,
              CategoryScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(fetchTypeTabs)
const fetchTypeTabsProvider = FetchTypeTabsProvider._();

final class FetchTypeTabsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProjectType>>,
          List<ProjectType>,
          FutureOr<List<ProjectType>>
        >
    with
        $FutureModifier<List<ProjectType>>,
        $FutureProvider<List<ProjectType>> {
  const FetchTypeTabsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchTypeTabsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchTypeTabsHash();

  @$internal
  @override
  $FutureProviderElement<List<ProjectType>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProjectType>> create(Ref ref) {
    return fetchTypeTabs(ref);
  }
}

String _$fetchTypeTabsHash() => r'1dca2d3f9c884ac0d7b860f54393b0749be5db83';

@ProviderFor(fetchCategoryProjects)
const fetchCategoryProjectsProvider = FetchCategoryProjectsFamily._();

final class FetchCategoryProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<CategoryModel>,
          CategoryModel,
          FutureOr<CategoryModel>
        >
    with $FutureModifier<CategoryModel>, $FutureProvider<CategoryModel> {
  const FetchCategoryProjectsProvider._({
    required FetchCategoryProjectsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchCategoryProjectsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchCategoryProjectsHash();

  @override
  String toString() {
    return r'fetchCategoryProjectsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CategoryModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CategoryModel> create(Ref ref) {
    final argument = this.argument as String;
    return fetchCategoryProjects(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCategoryProjectsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchCategoryProjectsHash() =>
    r'd18cff0cb608f300a823f320d2be74df9463f409';

final class FetchCategoryProjectsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CategoryModel>, String> {
  const FetchCategoryProjectsFamily._()
    : super(
        retry: null,
        name: r'fetchCategoryProjectsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchCategoryProjectsProvider call(String categoryId) =>
      FetchCategoryProjectsProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'fetchCategoryProjectsProvider';
}

@ProviderFor(fectchCategoryProjectsByType)
const fectchCategoryProjectsByTypeProvider =
    FectchCategoryProjectsByTypeFamily._();

final class FectchCategoryProjectsByTypeProvider
    extends
        $FunctionalProvider<
          AsyncValue<CategoryModel>,
          CategoryModel,
          FutureOr<CategoryModel>
        >
    with $FutureModifier<CategoryModel>, $FutureProvider<CategoryModel> {
  const FectchCategoryProjectsByTypeProvider._({
    required FectchCategoryProjectsByTypeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fectchCategoryProjectsByTypeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fectchCategoryProjectsByTypeHash();

  @override
  String toString() {
    return r'fectchCategoryProjectsByTypeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CategoryModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CategoryModel> create(Ref ref) {
    final argument = this.argument as String;
    return fectchCategoryProjectsByType(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FectchCategoryProjectsByTypeProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fectchCategoryProjectsByTypeHash() =>
    r'8d413b0c6d8b85a118df906c3fd2eb68fe85b760';

final class FectchCategoryProjectsByTypeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CategoryModel>, String> {
  const FectchCategoryProjectsByTypeFamily._()
    : super(
        retry: null,
        name: r'fectchCategoryProjectsByTypeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FectchCategoryProjectsByTypeProvider call(String categoryId) =>
      FectchCategoryProjectsByTypeProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'fectchCategoryProjectsByTypeProvider';
}
