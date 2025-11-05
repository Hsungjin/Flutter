import 'package:client/model/category/category_model.dart';
import 'package:client/repository/category/category_repository.dart';
import 'package:client/shared/model/project_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_view_model.g.dart';
part 'category_view_model.freezed.dart';

enum EnumCategoryProjectType {
  recommend("추천순"),
  lowFunded("펀딩 적은 순"),
  highFunded("펀딩 많은 순");

  final String value;

  const EnumCategoryProjectType(this.value);
}

@freezed
abstract class CategoryScreenState with _$CategoryScreenState {
  factory CategoryScreenState({
    ProjectType? selectedType,
    @Default(EnumCategoryProjectType.recommend)
    EnumCategoryProjectType? projectFilter,
    @Default([]) List<CategoryItemModel> projects,

    @Default(AsyncValue.loading())
    AsyncValue<List<CategoryItemModel>> projectState,
  }) = _CategoryScreenState;
}

@riverpod
class CategoryViewModel extends _$CategoryViewModel {
  @override
  CategoryScreenState build() {
    return CategoryScreenState(
      selectedType: ProjectType(id: 0, type: "전체"),
      projectFilter: EnumCategoryProjectType.recommend,
      projects: [],
    );
  }

  updateType(ProjectType type) {
    state = state.copyWith(
      selectedType: type,
      projectFilter: EnumCategoryProjectType.recommend,
    );
  }

  updateProjectFilter(EnumCategoryProjectType filter) {
    state = state.copyWith(
      projectState: const AsyncValue.loading(),
      projectFilter: filter,
    );

    final _projects = [...state.projects];

    if (filter == EnumCategoryProjectType.lowFunded) {
      _projects.sort((a, b) => a.totalFunded!.compareTo(b.totalFunded!));
    } else if (filter == EnumCategoryProjectType.highFunded) {
      _projects.sort((a, b) => b.totalFunded!.compareTo(a.totalFunded!));
    }

    state = state.copyWith(
      projectFilter: filter,
      projectState: AsyncValue.data(_projects),
    );
  }

  fetchProjects(String categoryId) async {
    state = state.copyWith(projectState: AsyncValue.loading());

    String typeId = "${state.selectedType?.id}";
    if (state.selectedType?.id == 0) {
      if (state.selectedType?.type == "전체") {
        typeId = "all";
      } else {
        typeId = "best";
      }
    }

    final AsyncValue<List<CategoryItemModel>> _state = await AsyncValue.guard(
      () async {
        final response = await ref
            .watch(categoryRepositoryProvider)
            .getCategoryProjects(categoryId, typeId);
        return response.projects;
      },
    );
    state = state.copyWith(projectState: _state, projects: _state.value ?? []);
  }
}

@riverpod
Future<List<ProjectType>> fetchTypeTabs(Ref ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
  return ref.read(categoryRepositoryProvider).getProjectTypes();
}

@riverpod
Future<CategoryModel> fetchCategoryProjects(Ref ref, String categoryId) async {
  final response = await ref
      .watch(categoryRepositoryProvider)
      .getProjectsByCategory(categoryId);
  return response;
}

@riverpod
Future<CategoryModel> fectchCategoryProjectsByType(
  Ref ref,
  String categoryId,
) async {
  final vm = ref.watch(categoryViewModelProvider);

  String typeId = "${vm.selectedType?.id}";
  if (vm.selectedType?.id == 0) {
    if (vm.selectedType?.type == "전체") {
      typeId = "all";
    } else {
      typeId = "best";
    }
  }

  final response = await ref
      .watch(categoryRepositoryProvider)
      .getCategoryProjects(categoryId, typeId);

  return response;
}
