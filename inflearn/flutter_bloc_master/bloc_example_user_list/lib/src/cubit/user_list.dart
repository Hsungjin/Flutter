import 'package:bloc_example_user_list/src/components/user_info.dart';
import 'package:bloc_example_user_list/src/cubit/user_list_cubit_extends.dart';
import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubitForExtends extends StatefulWidget {
  const UserListCubitForExtends({super.key});

  @override
  State<UserListCubitForExtends> createState() =>
      _UserListCubitForExtendsState();
}

class _UserListCubitForExtendsState extends State<UserListCubitForExtends> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent - 200 <= scrollController.offset) {
        context.read<UserListCubitExtends>().loadUserList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Extends 상태관리')),
      body: BlocBuilder<UserListCubitExtends, UserListCubitState>(
        builder: (context, state) {
          if (state is InitUserListCubitState) {
            return _loading();
          } else if (state is LoadUserListCubitState || state is LoadingUserListCubitState) {
            return _userListWidget(state.userInfoResults.userInfoList);
          } else if (state is ErrorUserListCubitState) {
            return _error();
          }
          return const SizedBox.shrink();
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
