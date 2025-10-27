import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncCounterNotifierProvider =
    AsyncNotifierProvider.autoDispose<AsyncCounterNotifier, int>(
      AsyncCounterNotifier.new,
    );

class AsyncCounterNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() async {
    Dio dio = Dio();
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    print(response.data);
    final users = response.data as List<dynamic>;
    return users.length;
  }

  sampleMethod() async {
    state = AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    state = AsyncValue.data(10);
    return state;
  }
}
