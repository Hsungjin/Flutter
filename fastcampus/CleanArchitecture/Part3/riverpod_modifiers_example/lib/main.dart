import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_modifiers_example/autoDispose/auto_dispose.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final post = ref.watch(postFutureProvider);
              return post.when(
                data: (data) => Text('${data}'),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Error: $error'),
              );
            },
          ),
        ),
      ),
    );
  }
}
