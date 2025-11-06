// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myPageRepository)
const myPageRepositoryProvider = MyPageRepositoryProvider._();

final class MyPageRepositoryProvider
    extends
        $FunctionalProvider<
          MyPageRepositoryImpl,
          MyPageRepositoryImpl,
          MyPageRepositoryImpl
        >
    with $Provider<MyPageRepositoryImpl> {
  const MyPageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myPageRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myPageRepositoryHash();

  @$internal
  @override
  $ProviderElement<MyPageRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MyPageRepositoryImpl create(Ref ref) {
    return myPageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyPageRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyPageRepositoryImpl>(value),
    );
  }
}

String _$myPageRepositoryHash() => r'03265b5110eda349bae204d1a359cfa7b70f40c0';
