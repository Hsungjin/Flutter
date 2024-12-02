import 'package:bloc_tutorial/counter_app.dart';
import 'package:bloc_tutorial/ex_bloc_builder/bloc_builder_page.dart';
import 'package:bloc_tutorial/ex_bloc_provider/bloc_provider_page.dart';
import 'package:bloc_tutorial/ex_multi_bloc_provider/multi_bloc_provider_page.dart';
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
      GoRoute(
        path: '/blocProviderPage',
        name: 'blocProviderPage',
        builder: (context, state) => const BlocProviderPage(),
      ),
      GoRoute(
        path: '/multiBlocProviderPage',
        name: 'multiBlocProviderPage',
        builder: (context, state) => const MultiBlocProviderPage(),
      ),
      GoRoute(
        path: '/blocBuilderPage',
        name: 'blocBuilderPage',
        builder: (context, state) => const BlocBuilderPage(),
      )
    ],
  );
}
