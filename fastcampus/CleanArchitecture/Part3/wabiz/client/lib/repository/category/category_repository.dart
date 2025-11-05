import 'package:client/model/category/category_model.dart';
import 'package:client/service/category/category_api.dart';
import 'package:client/service/category/category_api_service.dart';
import 'package:client/shared/model/project_type.dart';
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

  List<ProjectType> getProjectTypes() {
    List<ProjectType> defaultTypes = [
      ProjectType(id: 1, type: "테크가전", imagePath: "assets/icons/type/1.svg"),
      ProjectType(id: 2, type: "패션", imagePath: "assets/icons/type/2.svg"),
      ProjectType(id: 3, type: "뷰티", imagePath: "assets/icons/type/3.svg"),
      ProjectType(id: 4, type: "홈리빙", imagePath: "assets/icons/type/4.svg"),
      ProjectType(id: 5, type: "스포츠아웃도어", imagePath: "assets/icons/type/5.svg"),
      ProjectType(id: 6, type: "푸드", imagePath: "assets/icons/type/6.svg"),
      ProjectType(id: 7, type: "도서 전자책", imagePath: "assets/icons/type/7.svg"),
      ProjectType(id: 8, type: "클래스", imagePath: "assets/icons/type/8.svg"),
    ];
    return [
      ProjectType(id: 0, type: "전체", imagePath: "assets/icons/type/all.svg"),
      ProjectType(
        id: 0,
        type: "BEST 펀딩",
        imagePath: "assets/icons/type/best.svg",
      ),
      ...defaultTypes,
    ];
  }

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
