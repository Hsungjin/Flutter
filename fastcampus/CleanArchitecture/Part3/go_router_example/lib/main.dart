import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/shell_router/my_shell_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // final GoRouter _router = GoRouter(routes: $appRoutes);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: shellRouter);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.child});

  final Widget? child;

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/user')) return 1;
    if (location.startsWith('/login')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/user/123');
              break;
            case 2:
              context.go('/login');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: '로그인'),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Home Screen')),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text('홈스크린 입니다'),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Navigator.push(
  //               //   context,
  //               //   MaterialPageRoute(builder: (context) => LoginScreen()),
  //               // );
  //               // context.go('/login');
  //               LoginRoute().go(context);
  //             },
  //             child: Text('로그인 화면으로 이동'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Navigator.push(
  //               //   context,
  //               //   MaterialPageRoute(builder: (context) => UserScreen()),
  //               // );
  //               // context.push('/user');
  //               UserRoute("123").push(context);
  //             },
  //             child: Text('유저 화면으로 이동'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Login Screen'));
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('User Screen $userId'));
  }
}
