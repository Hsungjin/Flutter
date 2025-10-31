import 'package:client/repository/my_page/my_page_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_page_view_model.g.dart';
part 'my_page_view_model.freezed.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  factory MyPageState({bool? loginState}) = _MyPageState;
}

@riverpod
class MyPageViewModel extends _$MyPageViewModel {
  @override
  MyPageState build() {
    return MyPageState(loginState: false);
  }

  fetchUserProjects() async {}

  updateProject(String id) async {
    await ref.watch(myPageRepositoryProvider).updateProjectOpenState(id);
  }

  deleteProject(String id) async {
    await ref.watch(myPageRepositoryProvider).deleteProject(id);
  }
}
