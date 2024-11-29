import 'package:bloc_tutorial/counter_app.dart';
import 'package:bloc_tutorial/home.dart';
import 'package:bloc_tutorial/timer_app.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/counter',
        name: 'counter',
        builder: (context, state) => const CounterApp(),
      ),
      GoRoute(
        path: '/timer',
        name: 'timer',
        builder: (context, state) => const TimerApp(),
      ),
    ],
  );
}
