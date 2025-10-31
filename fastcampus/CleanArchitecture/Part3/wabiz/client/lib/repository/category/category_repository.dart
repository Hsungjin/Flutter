import 'package:client/model/category/category_model.dart';
import 'package:client/service/category/category_api.dart';
import 'package:client/service/category/category_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_repository.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final service = ref.watch(categoryApiServiceProvider);
  return CategoryRepository(service);
}

class CategoryRepository {
  CategoryApiClient categoryApiClient;

  CategoryRepository(this.categoryApiClient);

  Future<CategoryModel> getCategoryProjects(
    String categoryId,
    String projectTypeId,
  ) async {
    final result = await categoryApiClient.getProjectsByProjectType(
      categoryId: categoryId,
      projectTypeId: projectTypeId,
    );
    return result;
  }

  Future<CategoryModel> getProjectsByCategory(String categoryId) async {
    final result = await categoryApiClient.getProjectsByCategory(
      categoryId: categoryId,
    );
    return result;
  }
}
