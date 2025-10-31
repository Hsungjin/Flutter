import 'package:client/views/category/category_page.dart';
import 'package:client/views/home/home_page.dart';
import 'package:client/views/my_page/my_page.dart';
import 'package:client/views/wabiz_app_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return WabizAppShell(
          currentIndex: switch (state.uri.path) {
            '/home' => 0,
            '/project' => 1,
            '/subscribe' => 2,
            '/my' => 3,
            _ => 0,
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: '/category/:id',
              builder: (context, state) {
                final id = state.pathParameters['id'];
                return CategoryPage(categoryId: id ?? "1");
              },
            ),
          ],
        ),
        GoRoute(
          path: '/my',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const MyPage(),
        ),
      ],
    ),
  ],
);
