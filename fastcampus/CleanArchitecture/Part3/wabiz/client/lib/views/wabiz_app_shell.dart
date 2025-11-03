import 'package:client/theme.dart';
import 'package:client/view_model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WabizAppShell extends ConsumerStatefulWidget {
  const WabizAppShell({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;

  @override
  ConsumerState<WabizAppShell> createState() => _WabizAppShellState();
}

class _WabizAppShellState extends ConsumerState<WabizAppShell> {
  void _onItemTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go("/home");
        break;
      case 1:
        final loginState = ref.watch(loginViewModelProvider);
        if (loginState.isLogin) {
          GoRouter.of(context).push("/add");
        } else {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: Text("로그인 후 프로젝트 만들기를 할 수 있습니다.")),
          );
        }
        break;
      case 2:
        GoRouter.of(context).go("/home");
        break;
      case 3:
        GoRouter.of(context).go("/my");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 1 ? Icons.add : Icons.add_outlined,
            ),
            label: '프로젝트',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 2 ? Icons.favorite : Icons.favorite_border,
            ),
            label: '구독',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 3 ? Icons.person : Icons.person_outline,
            ),
            label: '마이페이지',
          ),
        ],
        currentIndex: widget.currentIndex,
        onTap: (index) => _onItemTap(index, context),
      ),
    );
  }
}
