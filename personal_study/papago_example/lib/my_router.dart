import 'package:go_router/go_router.dart';
import 'package:papago_example/input_text_page.dart';
import 'package:papago_example/long_text.dart';

import 'home.dart';

class MyRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/input', builder: (context, state) => const InputTextPage()),
      GoRoute(path: '/long', builder: (context, state) => const LongText()),
    ],
  );
}
