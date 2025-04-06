import 'package:bloc_example_user_list/src/cubit/user_list.dart';
import 'package:bloc_example_user_list/src/cubit/user_list_cubit_extends.dart';
import 'package:bloc_example_user_list/src/cubit_copywith/user_list.dart';
import 'package:bloc_example_user_list/src/cubit_copywith/user_list_cubit_copywith.dart';
import 'package:bloc_example_user_list/src/getx/user_list.dart';
import 'package:bloc_example_user_list/src/getx/user_list_controller.dart';
import 'package:bloc_example_user_list/src/set_state/user_list_page_set_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListPageSetState(),
                  ),
                );
              },
              child: const Text('SetState 상태관리'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.put(UserListController());
                Get.to(() => const UserListForGetX());
              },
              child: const Text('GetX 상태관리'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => UserListCubitExtends(),
                      child: const UserListCubitForExtends(),
                    ),
                  ),
                );
              },
              child: const Text('Extends 상태관리'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => UserListCubitCopyWith(),
                      child: const UserListForCubitCopyWith(),
                    ),
                  ),
                );
              },
              child: const Text('CopyWith 상태관리'),
            ),
          ],
        ),
      ),
    );
  }
}