// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyPageViewModel)
const myPageViewModelProvider = MyPageViewModelProvider._();

final class MyPageViewModelProvider
    extends $NotifierProvider<MyPageViewModel, MyPageState> {
  const MyPageViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myPageViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myPageViewModelHash();

  @$internal
  @override
  MyPageViewModel create() => MyPageViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyPageState>(value),
    );
  }
}

String _$myPageViewModelHash() => r'ec6f079fceaf60c2a8d7b609c2a407896b6593d3';

abstract class _$MyPageViewModel extends $Notifier<MyPageState> {
  MyPageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MyPageState, MyPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MyPageState, MyPageState>,
              MyPageState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
