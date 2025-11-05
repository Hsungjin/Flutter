import 'package:client/model/login/login_model.dart';
import 'package:client/model/project/project_model.dart';
import 'package:client/repository/my_page/my_page_repository.dart';
import 'package:client/shared/model/response_model.dart';
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

  Future<List<ProjectItemModel>> fetchUserProjects() async {
    final userId = state.loginModel?.id;

    final repository = ref.watch(myPageRepositoryProvider);
    final result = await repository.getProjectByUserId(userId.toString());
    return result.data;
  }

  Future<bool> updateProjectOpenState(String id, ProjectItemModel body) async {
    final repository = ref.watch(myPageRepositoryProvider);
    final result = await repository.updateProjectOpenState(id, body);
    if (result.status == "ok") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProject(String id) async {
    final repository = ref.watch(myPageRepositoryProvider);
    final result = await repository.deleteProject(id);
    if (result.status == "ok") {
      return true;
    } else {
      return false;
    }
  }
}
