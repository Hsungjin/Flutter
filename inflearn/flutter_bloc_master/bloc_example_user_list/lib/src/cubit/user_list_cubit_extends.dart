import 'package:bloc/bloc.dart';
import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UserListCubitExtends extends Cubit<UserListCubitState> {
  late Dio _dio;
  UserListCubitExtends() : super(InitUserListCubitState()){
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
    loadUserList();
  }

  loadUserList() async {
    try {
      if (state is LoadingUserListCubitState || state is ErrorUserListCubitState) {
        return;
      }
      print(state.userInfoResults.currentPage);
      emit(LoadingUserListCubitState(userInfoResults: state.userInfoResults));
      final response = await _dio.get('api', queryParameters: {
        'results': 10,
        'seed': 'sudar',
        'page': state.userInfoResults.currentPage,
      });
      await Future.delayed(const Duration(seconds: 1));
      emit(LoadUserListCubitState(userInfoResults: state.userInfoResults.copyWithFromJson(response.data)));
    } catch (e) {
      emit(ErrorUserListCubitState(userInfoResults: state.userInfoResults, errorMessage: e.toString()));
    }
  }
}

abstract class UserListCubitState extends Equatable {
  final UserInfoResults userInfoResults;
  const UserListCubitState({required this.userInfoResults});
}

// 초기상태
class InitUserListCubitState extends UserListCubitState {
  InitUserListCubitState() : super(userInfoResults: UserInfoResults.init());

  @override
  List<Object?> get props => [userInfoResults];
}

// 로딩
class LoadingUserListCubitState extends UserListCubitState {
  const LoadingUserListCubitState({required super.userInfoResults});

  @override
  List<Object?> get props => [userInfoResults];
}

// 오류
class ErrorUserListCubitState extends UserListCubitState {
  final String errorMessage;
  const ErrorUserListCubitState({required super.userInfoResults, required this.errorMessage});

  @override
  List<Object?> get props => [userInfoResults, errorMessage];
}

// 로드
class LoadUserListCubitState extends UserListCubitState {
  const LoadUserListCubitState({required super.userInfoResults});

  @override
  List<Object?> get props => [userInfoResults];
}