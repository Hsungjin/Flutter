import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_page_repository.g.dart';

@riverpod
MyPageRepositoryImpl myPageRepository(Ref ref) {
  return MyPageRepositoryImpl();
}

abstract class MyPageRepository {
  Future getProjectByUserId(String userId);

  Future updateProjectOpenState(String id);

  Future deleteProject(String id);
}

class MyPageRepositoryImpl implements MyPageRepository {
  @override
  Future getProjectByUserId(String userId) async {}

  @override
  Future updateProjectOpenState(String id) async {}

  @override
  Future deleteProject(String id) async {}
}
