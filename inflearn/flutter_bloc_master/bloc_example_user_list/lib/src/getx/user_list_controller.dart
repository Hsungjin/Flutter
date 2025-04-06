import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  late Dio _dio;
  ScrollController scrollController = ScrollController();
  Rx<UserInfoResults> userInfoResults = UserInfoResults.init().obs;
  int nextPage = -1;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent * 0.7 <=
          scrollController.offset && nextPage != userInfoResults.value.currentPage) {
        nextPage = userInfoResults.value.currentPage;
        _loadUserList();
      }
    });
    
    // 초기 데이터 로드
    _loadUserList();
  }

  Future<void> _loadUserList() async {
    final response = await _dio.get('api', queryParameters: {
      'results': 10,
      'seed': 'sudar',
      'page': userInfoResults.value.currentPage,
    });

    userInfoResults.value = userInfoResults.value.copyWithFromJson(response.data);
  }
}