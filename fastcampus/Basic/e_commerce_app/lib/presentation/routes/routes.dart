import 'package:e_commerce_app/presentation/pages/category/category_page.dart';
import 'package:e_commerce_app/presentation/pages/home/home_page.dart';
import 'package:e_commerce_app/presentation/main/main_screen.dart';
import 'package:e_commerce_app/presentation/pages/search/search_page.dart';
import 'package:e_commerce_app/presentation/pages/splash/splash_page.dart';
import 'package:e_commerce_app/presentation/pages/user/user_page.dart';
import 'package:e_commerce_app/presentation/routes/routes_path.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesPath.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: RoutesPath.main,
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),

    GoRoute(
      path: RoutesPath.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: RoutesPath.category,
      name: 'category',
      builder: (context, state) => const CategoryPage(),
    ),

    GoRoute(
      path: RoutesPath.search,
      name: 'search',
      builder: (context, state) => const SearchPage(),
    ),

    GoRoute(
      path: RoutesPath.user,
      name: 'user',
      builder: (context, state) => const UserPage(),
    ),
  ],
  initialLocation: RoutesPath.splash,
);
