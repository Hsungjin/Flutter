// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectApiService)
const projectApiServiceProvider = ProjectApiServiceProvider._();

final class ProjectApiServiceProvider
    extends
        $FunctionalProvider<
          ProjectApiClient,
          ProjectApiClient,
          ProjectApiClient
        >
    with $Provider<ProjectApiClient> {
  const ProjectApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectApiServiceHash();

  @$internal
  @override
  $ProviderElement<ProjectApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectApiClient create(Ref ref) {
    return projectApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectApiClient>(value),
    );
  }
}

String _$projectApiServiceHash() => r'f62df0799bee7d1faf9acc90263f591fedd175da';
