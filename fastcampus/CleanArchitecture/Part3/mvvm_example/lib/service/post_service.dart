import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_example/model/post_model.dart';

final postRepositoryProvider = Provider((ref) {
  return PostRepositoryImpl(ref.read(postServiceProvider));
});

final postServiceProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return PostServiceImpl(dio);
});

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

abstract class PostRepository {
  Future<List<PostModel>?> getPosts();
}

class PostRepositoryImpl implements PostRepository {
  PostServiceImpl postServiceImpl;

  PostRepositoryImpl(this.postServiceImpl);

  @override
  Future<List<PostModel>?> getPosts() async {
    return await postServiceImpl.getPosts();
  }
}

abstract class PostService {
  Future<List<PostModel>?> getPosts();
}

class PostServiceImpl implements PostService {
  final Dio dio;

  PostServiceImpl(this.dio);

  @override
  Future<List<PostModel>?> getPosts() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      List<PostModel> posts = jsonList
          .map((json) => PostModel.fromJson(json))
          .toList();
      return posts;
    } else {
      return [];
    }
  }
}
