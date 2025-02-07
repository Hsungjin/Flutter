import 'package:creadit_card_example/screen/add_card_screen.dart';
import 'package:creadit_card_example/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/add-card',
        builder: (context, state) => const AddCardScreen(),
      )
    ],
  );
}