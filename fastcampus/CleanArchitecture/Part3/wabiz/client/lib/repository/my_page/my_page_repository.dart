import 'package:client/model/project/project_model.dart';
import 'package:client/service/project/project_api.dart';
import 'package:client/service/project/project_api_service.dart';
import 'package:client/shared/model/response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_page_repository.g.dart';

@riverpod
MyPageRepositoryImpl myPageRepository(Ref ref) {
  final projectService = ref.watch(projectApiServiceProvider);
  return MyPageRepositoryImpl(projectService);
}

abstract class MyPageRepository {
  Future getProjectByUserId(String userId);

  Future updateProjectOpenState(String id, ProjectItemModel body);

  Future deleteProject(String id);
}

class MyPageRepositoryImpl implements MyPageRepository {
  ProjectApiClient projectService;

  MyPageRepositoryImpl(this.projectService);

  @override
  Future getProjectByUserId(String userId) async {
    final result = await projectService.getProjectByUserId(userId);
    return result;
  }

  @override
  Future updateProjectOpenState(String id, ProjectItemModel body) async {
    final result = await projectService.updateProjectOpenState(id, body);
    return result;
  }

  @override
  Future<ResponseModel> deleteProject(String id) async {
    final result = await projectService.deleteProject(id);
    return result;
  }
}
