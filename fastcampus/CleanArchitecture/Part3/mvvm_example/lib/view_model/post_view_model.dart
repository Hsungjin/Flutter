import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_example/model/post_model.dart';
import 'package:mvvm_example/service/post_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final postViewModelProvider = Provider((ref) {
  final repository = ref.read(postRepositoryProvider);
  return PostViewModel(repository);
});

final fetchPostsProvider = FutureProvider.autoDispose<List<PostModel>?>((
  ref,
) async {
  return ref.read(postViewModelProvider).getPosts();
});

class PostViewModel {
  PostRepositoryImpl postRepositoryImpl;

  PostViewModel(this.postRepositoryImpl);

  Future<List<PostModel>?> getPosts() async {
    try {
      final posts = await postRepositoryImpl.getPosts();
      return posts;
    } on DioException catch (e) {
      print(e.toString());
      return [];
    }
  }
}

final fetchPostsProvider2 = FutureProvider.autoDispose((ref) async {
  final dio = ref.read(dioProvider);
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
});

final asyncPostNotifier =
    AsyncNotifierProvider<AsyncPostNotifier, List<PostModel>?>(
      (AsyncPostNotifier.new),
    );

class AsyncPostNotifier extends AsyncNotifier<List<PostModel>?> {
  @override
  Future<List<PostModel>?> build() async {
    final dio = ref.read(dioProvider);
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

// part 'post_view_model.g.dart';

// @riverpod
// class AsyncPostGenNotifier extends _$AsyncPostGenNotifier {
//   _fetchPosts() async {
//     Dio dio = Dio();
//     final response = await dio.get(
//       'https://jsonplaceholder.typicode.com/posts',
//       options: Options(headers: {'Content-Type': 'application/json'}),
//     );
//     if (response.statusCode == 200) {
//       List<dynamic> jsonList = response.data;
//       List<PostModel> posts = jsonList
//           .map((json) => PostModel.fromJson(json))
//           .toList();
//       return posts;
//     } else {
//       return [];
//     }
//   }

//   @override
//   Future<List<PostModel>?> build() async {
//     return await _fetchPosts();
//   }
// }
