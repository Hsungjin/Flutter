import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/future_provider/simple_future_provider.dart';

class MyFutureProviderWidget extends ConsumerWidget {
  const MyFutureProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(simpleIntFutureProvider);
    return future.when(
      data: (data) => Center(child: Text(data.toString())),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: Text("로딩중")),
    );
  }
}
