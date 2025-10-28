import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';

part 'builder_router.g.dart';

@TypedGoRoute<HomeRoute>(
  path: "/",
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<UserRoute>(path: "user/:userId"),
  ],
)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<LoginRoute>(path: "login")
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen();
  }
}

class UserRoute extends GoRouteData with $UserRoute {
  const UserRoute(this.userId);

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserScreen(userId: userId);
  }
}
