import 'package:client/domain/entitiy/home/home_entity.dart';

abstract class HomeRepository {
  Future<List<HomeEntity>> getHomeProjects();
}