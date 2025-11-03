// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchProjectTypes)
const fetchProjectTypesProvider = FetchProjectTypesProvider._();

final class FetchProjectTypesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProjectType>>,
          List<ProjectType>,
          FutureOr<List<ProjectType>>
        >
    with
        $FutureModifier<List<ProjectType>>,
        $FutureProvider<List<ProjectType>> {
  const FetchProjectTypesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchProjectTypesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchProjectTypesHash();

  @$internal
  @override
  $FutureProviderElement<List<ProjectType>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProjectType>> create(Ref ref) {
    return fetchProjectTypes(ref);
  }
}

String _$fetchProjectTypesHash() => r'2178848de369dde04810124371991bdedf924cf6';

@ProviderFor(ProjectViewModel)
const projectViewModelProvider = ProjectViewModelProvider._();

final class ProjectViewModelProvider
    extends $NotifierProvider<ProjectViewModel, ProjectItemModel?> {
  const ProjectViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectViewModelHash();

  @$internal
  @override
  ProjectViewModel create() => ProjectViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectItemModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectItemModel?>(value),
    );
  }
}

String _$projectViewModelHash() => r'64eb2c40feeff370b85f575038b2553eafc1af30';

abstract class _$ProjectViewModel extends $Notifier<ProjectItemModel?> {
  ProjectItemModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProjectItemModel?, ProjectItemModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectItemModel?, ProjectItemModel?>,
              ProjectItemModel?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
