import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/stream_provider/simple_stream_provider.dart';

class MyStreamProviderWidget extends ConsumerWidget {
  const MyStreamProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(simpleIntStreamProvider);
    return switch (counter) {
      AsyncData(:final value) => Center(child: Text(value.toString())),
      AsyncError(:final error) => Text(error.toString()),
      AsyncLoading() => const Center(child: Text("로딩중")),
    };
    // return counter.when(
    //   data: (data) => Center(child: Text(data.toString())),
    //   error: (error, stackTrace) => Text(error.toString()),
    //   loading: () => const Center(child: Text("로딩중")),
    // );
  }
}
