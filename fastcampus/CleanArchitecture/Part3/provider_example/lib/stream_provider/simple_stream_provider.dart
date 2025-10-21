import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleIntStreamProvider = StreamProvider<int>((ref) async* {
  await Future.delayed(Duration(seconds: 3));
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
});
