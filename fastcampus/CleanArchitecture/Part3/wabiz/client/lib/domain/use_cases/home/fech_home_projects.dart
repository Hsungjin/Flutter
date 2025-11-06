import 'package:client/data/repository/home/home_repository_impl.dart';
import 'package:client/domain/entitiy/home/home_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fech_home_projects.g.dart';

@riverpod
Future<List<HomeEntity>> fetchHomeProjects(Ref ref) async {
  final repository = ref.watch(homeRepositoryProvider);
  final result = await repository.getHomeProjects();
  return result;
}
