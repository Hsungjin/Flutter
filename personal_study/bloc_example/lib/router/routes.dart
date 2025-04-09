import 'package:bloc_example/counter/view/view.dart';
import 'package:bloc_example/home.dart';
import 'package:bloc_example/router/route_path.dart';
import 'package:go_router/go_router.dart';

import '../posts/view/view.dart';
import '../timer/view/timer.dart';

class Routes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.home,
        name: 'home',
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: RoutePath.counter,
        name: 'counter',
        builder: (context, state) => const CounterPage(),
      ),
      GoRoute(
        path: RoutePath.timer,
        name: 'timer',
        builder: (context, state) => const TimerPage(),
      ),
      GoRoute(
        path: RoutePath.post,
        name: 'post',
        builder: (context, state) => const PostPage(),
      ),
    ],
  );
}
