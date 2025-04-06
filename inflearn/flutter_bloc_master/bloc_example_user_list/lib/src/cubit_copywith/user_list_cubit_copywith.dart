import 'package:bloc_example_user_list/src/model/user_info_results.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubitCopyWith extends Cubit<UserListCubitState> {
  late Dio _dio;
  UserListCubitCopyWith() : super(UserListCubitState.init()) {
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
    loadUserList();
  }

  loadUserList() async {
    try {
      if (state.status == UserListCubitStatus.loading || state.status == UserListCubitStatus.error) {
        return;
      }

      emit(state.copyWith(status: UserListCubitStatus.loading));

      final response = await _dio.get('/api', 
      queryParameters: {
        'results': 10,
        'seed': 'sudar',
        'page': state.userInfoResults.currentPage,
      });
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: UserListCubitStatus.loaded, userInfoResults: state.userInfoResults.copyWithFromJson(response.data)));
    } catch (e) {
      emit(state.copyWith(status: UserListCubitStatus.error, errorMessage: e.toString()));
    }
  }
}

enum UserListCubitStatus {
  init,
  loading,
  loaded,
  error
}
class UserListCubitState extends Equatable {
  final UserListCubitStatus status;
  final UserInfoResults userInfoResults;
  final String? errorMessage;

  const UserListCubitState({required this.status, required this.userInfoResults, this.errorMessage});

  UserListCubitState.init() : this(status: UserListCubitStatus.init, userInfoResults: UserInfoResults.init());

  UserListCubitState copyWith({
    UserListCubitStatus? status,
    UserInfoResults? userInfoResults,
    String? errorMessage,
  }) {
    return UserListCubitState(status: status ?? this.status, userInfoResults: userInfoResults ?? this.userInfoResults, errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, userInfoResults, errorMessage];
}
