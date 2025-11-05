import 'dart:convert';

import 'package:client/model/category/category_model.dart';
import 'package:client/repository/favorite/favorite_repository.dart';
import 'package:client/shared/enum/enum_shared_pref_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_view_model.g.dart';

@riverpod
class FavoriteViewModel extends _$FavoriteViewModel {
  @override
  CategoryModel build() {
    String? value = ref
        .watch(favoriteRepositoryProvider)
        .readValue(EnumSharedPreferenceKey.favoriteProjects.value);

    if (value == null) {
      return CategoryModel(projects: []);
    }

    return CategoryModel.fromJson(jsonDecode(value));
  }

  addItem(CategoryItemModel item) {
    final oldState = state.projects;
    state = state.copyWith(projects: [...oldState, item]);
    ref
        .read(favoriteRepositoryProvider)
        .saveValue(
          EnumSharedPreferenceKey.favoriteProjects.value,
          jsonEncode(state.toJson()),
        );
  }

  removeItem(CategoryItemModel item) {
    final oldState = [...state.projects];
    oldState.removeWhere((element) => element.id == item.id);
    state = state.copyWith(projects: oldState);
    
    ref
        .read(favoriteRepositoryProvider)
        .saveValue(
          EnumSharedPreferenceKey.favoriteProjects.value,
          jsonEncode(state.toJson()),
        );
  }
}
