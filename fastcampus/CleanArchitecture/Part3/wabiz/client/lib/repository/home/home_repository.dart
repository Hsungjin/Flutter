import 'package:client/model/home/home_model.dart';
import 'package:client/service/home/home_api.dart';
import 'package:client/service/home/home_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

// abstract class HomeRepository {
//   Future<HomeModel> getHomeProjects();
// }

// class HomeRepositoryImpl implements HomeRepository {
//   HomeApi homeApiService;

//   HomeRepositoryImpl({required this.homeApiService});

//   @override
//   Future<HomeModel> getHomeProjects() async {
//     final result = await homeApiService.getHomeProjects();
//     return result;
//   }
// }


class HomeRepository {
  HomeApi homeApiService;

  HomeRepository(this.homeApiService);

  Future<HomeModel> getHomeProjects() async {
    final result = await homeApiService.getHomeProjects();
    return result;
  }
}

@riverpod
HomeRepository homeRepository(Ref ref) {
  final service = ref.watch(homeApiServiceProvider);
  return HomeRepository(service);
}
