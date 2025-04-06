import 'package:bloc_example_user_list/src/components/user_info.dart';
import 'package:bloc_example_user_list/src/cubit_copywith/user_list_cubit_copywith.dart';
import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListForCubitCopyWith extends StatefulWidget {
  const UserListForCubitCopyWith({super.key});

  @override
  State<UserListForCubitCopyWith> createState() => _UserListForCubitCopyWithState();
}

class _UserListForCubitCopyWithState extends State<UserListForCubitCopyWith> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent - 200 <= scrollController.offset) {
        context.read<UserListCubitCopyWith>().loadUserList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit CopyWith 상태관리')),
      body: BlocBuilder<UserListCubitCopyWith, UserListCubitState>(
        builder: (context, state) {
          switch (state.status) {
            case UserListCubitStatus.init:
            case UserListCubitStatus.loading:
            case UserListCubitStatus.loaded:
              return _userListWidget(state.userInfoResults.userInfoList);
            case UserListCubitStatus.error:
              return _error();
          }
        }
      ),
    );
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _error() {
    return const Center(child: Text('Error'));
  }

  Widget _userListWidget(List<UserInfo> userInfoList) {
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index == userInfoList.length) {
          return _loading();
        }
        return UserInfoWidget(userInfo: userInfoList[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: userInfoList.length + 1,
    );
  }
}