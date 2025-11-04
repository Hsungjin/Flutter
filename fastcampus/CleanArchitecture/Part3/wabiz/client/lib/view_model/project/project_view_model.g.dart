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

@ProviderFor(fetchProject)
const fetchProjectProvider = FetchProjectFamily._();

final class FetchProjectProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProjectModel>,
          ProjectModel,
          FutureOr<ProjectModel>
        >
    with $FutureModifier<ProjectModel>, $FutureProvider<ProjectModel> {
  const FetchProjectProvider._({
    required FetchProjectFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchProjectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchProjectHash();

  @override
  String toString() {
    return r'fetchProjectProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProjectModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProjectModel> create(Ref ref) {
    final argument = this.argument as String;
    return fetchProject(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProjectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchProjectHash() => r'29e1694782105153b3c74cca7d29804a588a3cde';

final class FetchProjectFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProjectModel>, String> {
  const FetchProjectFamily._()
    : super(
        retry: null,
        name: r'fetchProjectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchProjectProvider call(String id) =>
      FetchProjectProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchProjectProvider';
}

@ProviderFor(ProjectDetailViewModel)
const projectDetailViewModelProvider = ProjectDetailViewModelFamily._();

final class ProjectDetailViewModelProvider
    extends $AsyncNotifierProvider<ProjectDetailViewModel, ProjectItemModel> {
  const ProjectDetailViewModelProvider._({
    required ProjectDetailViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'projectDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectDetailViewModelHash();

  @override
  String toString() {
    return r'projectDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectDetailViewModel create() => ProjectDetailViewModel();

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectDetailViewModelHash() =>
    r'89f8709157ea91aa5f9320599e68602e5b522bde';

final class ProjectDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectDetailViewModel,
          AsyncValue<ProjectItemModel>,
          ProjectItemModel,
          FutureOr<ProjectItemModel>,
          String
        > {
  const ProjectDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'projectDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectDetailViewModelProvider call(String id) =>
      ProjectDetailViewModelProvider._(argument: id, from: this);

  @override
  String toString() => r'projectDetailViewModelProvider';
}

abstract class _$ProjectDetailViewModel
    extends $AsyncNotifier<ProjectItemModel> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<ProjectItemModel> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<ProjectItemModel>, ProjectItemModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectItemModel>, ProjectItemModel>,
              AsyncValue<ProjectItemModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

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
