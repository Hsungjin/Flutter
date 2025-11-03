import 'package:client/model/login/login_model.dart';
import 'package:client/repository/my_page/my_page_repository.dart';
import 'package:client/view_model/login/login_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_page_view_model.g.dart';
part 'my_page_view_model.freezed.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  factory MyPageState({bool? loginState, LoginModel? loginModel}) =
      _MyPageState;
}

@riverpod
class MyPageViewModel extends _$MyPageViewModel {
  @override
  MyPageState build() {
    final status = ref.watch(loginViewModelProvider);
    return MyPageState(
      loginState: status.isLogin,
      loginModel: LoginModel(
        id: status.userid,
        email: status.email,
        password: status.password,
        username: status.username,
      ),
    );
  }

  fetchUserProjects() async {}

  updateProject(String id) async {
    await ref.watch(myPageRepositoryProvider).updateProjectOpenState(id);
  }

  deleteProject(String id) async {
    await ref.watch(myPageRepositoryProvider).deleteProject(id);
  }
}
