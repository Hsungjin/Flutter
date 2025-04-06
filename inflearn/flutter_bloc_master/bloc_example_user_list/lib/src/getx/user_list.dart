import 'package:bloc_example_user_list/src/components/user_info.dart';
import 'package:bloc_example_user_list/src/getx/user_list_controller.dart';
import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserListForGetX extends GetView<UserListController> {
  const UserListForGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX 상태관리')),
      body: Obx(() => _userListWidget(controller.userInfoResults.value.userInfoList)),
    );
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _error() {
    return const Center(child: Text('Error'));
  }

  Widget _userListWidget(List<UserInfo> userInfoList) {
    if (userInfoList.isEmpty) {
      return _loading();
    }

    return ListView.separated(
      controller: controller.scrollController,
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