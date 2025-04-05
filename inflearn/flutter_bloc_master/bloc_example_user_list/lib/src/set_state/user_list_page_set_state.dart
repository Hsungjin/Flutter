import 'package:bloc_example_user_list/src/components/user_info.dart';
import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserListPageSetState extends StatefulWidget {
  const UserListPageSetState({super.key});

  @override
  State<UserListPageSetState> createState() => _UserListPageSetStateState();
}

class _UserListPageSetStateState extends State<UserListPageSetState> {
  late Dio _dio;
  late UserInfoResults userInfoResults;
  ScrollController _scrollController = ScrollController();
  int nextPage = -1;

  @override
  void initState() {
    super.initState();
    userInfoResults = UserInfoResults(currentPage: 0, userInfoList: []);
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent * 0.7 <=
          _scrollController.offset && nextPage != userInfoResults.currentPage) {
        nextPage = userInfoResults.currentPage;
        setState(() {});
      }
    });
  }

  Future<UserInfoResults> _loadUserList() async {
    final response = await _dio.get('api', queryParameters: {
      'results': 10,
      'seed': 'sudar',
      'page': userInfoResults.currentPage,
    });

    Future.delayed(const Duration(seconds: 1));

    if (response.statusCode == 200) {
      userInfoResults = userInfoResults.copyWithFromJson(response.data);
      return userInfoResults;
    }

    return UserInfoResults(currentPage: 0, userInfoList: []);
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _error() {
    return const Center(child: Text('Error'));
  }

  Widget _userListWidget(List<UserInfo> userInfoList) {
    return ListView.separated(
      controller: _scrollController,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SetState 상태관리')),
      body: FutureBuilder<UserInfoResults>(
        future: _loadUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _userListWidget(snapshot.data!.userInfoList);
          }

          if (snapshot.hasError) {
            return _error();
          }

          return _loading();
        },
      ),
    );
  }
}
