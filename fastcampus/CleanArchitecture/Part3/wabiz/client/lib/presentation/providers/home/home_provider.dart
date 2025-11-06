import 'package:client/domain/entitiy/home/home_entity.dart';
import 'package:client/domain/repository/home/home_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/use_cases/home/fech_home_projects.dart';

part 'home_provider.g.dart';
part 'home_provider.freezed.dart';

@freezed
abstract class HomeProviderState with _$HomeProviderState {
  factory HomeProviderState({@Default([]) List<HomeEntity> projects}) =
      _HomeProviderState;
}

@riverpod
class HomeProvider extends _$HomeProvider {
  late final HomeRepository homeRepository;

  @override
  Future<HomeProviderState> build() async {
    final result = await ref.watch(fetchHomeProjectsProvider.future);
    return HomeProviderState(projects: result);
  }
}
