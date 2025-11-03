import 'package:client/model/project/project_model.dart';
import 'package:client/model/project/reward_model.dart';
import 'package:client/service/project/project_api.dart';
import 'package:client/service/project/project_api_service.dart';
import 'package:client/shared/model/response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_repository.g.dart';

class ProjectRepository {
  ProjectApiClient projectService;

  ProjectRepository(this.projectService);

  Future<ResponseModel> createProject(ProjectItemModel body) async {
    final result = await projectService.createProject(body);
    return result;
  }

  Future<ResponseModel> updateProjectOpenState(
    String id,
    ProjectItemModel body,
  ) async {
    final result = await projectService.updateProjectOpenState(id, body);
    return result;
  }

  Future<ResponseModel> deleteProject(String id) async {
    final result = await projectService.deleteProject(id);
    return result;
  }

  Future<ResponseModel> createProjectReward(
    String id,
    RewardItemModel body,
  ) async {
    final result = await projectService.createProjectReward(id, body);
    return result;
  }

  Future<ProjectModel> getProjectByUserId(String userId) async {
    final result = await projectService.getProjectByUserId(userId);
    return result;
  }
}

@riverpod
ProjectRepository projectRepository(Ref ref) {
  final service = ref.watch(projectApiServiceProvider);
  return ProjectRepository(service);
}
