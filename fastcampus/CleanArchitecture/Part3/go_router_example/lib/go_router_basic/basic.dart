import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';

final GoRouter routerBasic = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'user',
          builder: (context, state) => UserScreen(userId: "123"),
        ),
      ],
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    // GoRoute(path: '/user', builder: (context, state) => UserScreen()),
  ],
);
