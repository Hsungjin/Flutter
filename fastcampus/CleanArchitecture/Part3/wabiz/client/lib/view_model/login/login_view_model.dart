import 'dart:convert';

import 'package:client/model/login/login_model.dart';
import 'package:client/repository/login/login_repository.dart';
import 'package:client/shared/model/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.freezed.dart';
part 'login_view_model.g.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLogin,
    int? userid,
    String? email,
    String? password,
    String? username,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      isLogin: false,
      userid: 0,
      email: "",
      password: "",
      username: "",
    );
  }
}

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState.initial();
  }

  Future<bool> signUp(LoginModel body) async {
    final repository = ref.read(loginRepositoryProvider);
    final result = await repository.signUp(body);

    if (!ref.mounted) return false;

    if (result.status == "ok") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkEmail(LoginModel body) async {
    final repository = ref.read(loginRepositoryProvider);
    final result = await repository.checkEmail(body);

    if (!ref.mounted) return false;

    if (result.status == "ok") {
      return true;
    } else {
      return false;
    }
  }

  Future<ResponseModel?> signIn(String email, String password) async {
    final repository = ref.read(loginRepositoryProvider);
    final response = await repository.signIn(
      LoginModel(email: email, password: password),
    );

    if (!ref.mounted) return response;

    if (response != null) {
      final data = LoginModel.fromJson(jsonDecode(response.body ?? ""));
      state = state.copyWith(
        isLogin: true,
        userid: data.id,
        email: data.email,
        username: data.username,
      );
    }
    return response;
  }

  bool signOut() {
    state = state.copyWith(
      isLogin: false,
      email: "",
      username: "",
      password: "",
    );
    return true;
  }
}
