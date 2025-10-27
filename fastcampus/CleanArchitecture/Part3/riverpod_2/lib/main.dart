import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_2/async_notifier_provider/my_asnyc_notifier_provider.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class RiverpodWidget extends ConsumerWidget {
  const RiverpodWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text("Riverpod Widget");
  }
}

class RiverpodWidget2 extends ConsumerStatefulWidget {
  const RiverpodWidget2({super.key});

  @override
  ConsumerState<RiverpodWidget2> createState() => _RiverpodWidget2State();
}

class _RiverpodWidget2State extends ConsumerState<RiverpodWidget2> {
  @override
  Widget build(BuildContext context) {
    return Text("Riverpod Widget 2");
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final asyncValue = ref.watch(asyncCounterNotifierProvider);
                if (asyncValue.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (asyncValue.hasError) {
                  return Center(child: Text(asyncValue.error.toString()));
                } else {
                  return Center(
                    child: Text(
                      "Counter: ${asyncValue.value.toString()}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
