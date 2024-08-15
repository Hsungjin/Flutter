import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/presentation/root.dart';

class ShellUserScreen extends StatelessWidget {
  const ShellUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => context.pop(),
      onTap: () => context.push('/auth/logout'),
      child: Icon(Icons.person, size: 120),
    );
  }
}
