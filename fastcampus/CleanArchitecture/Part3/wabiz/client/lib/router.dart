import 'package:client/views/category/category_page.dart';
import 'package:client/views/home/home_page.dart';
import 'package:client/views/login/sign_in_page.dart';
import 'package:client/views/login/sign_up_page.dart';
import 'package:client/views/my_page/my_page.dart';
import 'package:client/views/project/add_project_page.dart';
import 'package:client/views/project/add_reward_page.dart';
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
            '/add' => 1,
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
    GoRoute(
      path: '/sign-up',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/sign-in',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/add',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AddProjectPage(),
      routes: [
        GoRoute(
          path: '/reward/:id',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            final projectId = state.pathParameters['id']!;
            return AddRewardPage(projectId: projectId);
          },
        ),
      ],
    ),
  ],
);
