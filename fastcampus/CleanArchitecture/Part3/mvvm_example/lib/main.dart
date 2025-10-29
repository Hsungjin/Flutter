import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_example/model/post_model.dart';
import 'package:mvvm_example/view_model/post_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final viewModel = ref.watch(postViewModelProvider);
            return FutureBuilder(
              future: viewModel.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final posts = snapshot.data;
                  if (posts == null || posts.isEmpty) {
                    return const Center(child: Text('No posts found'));
                  }
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].id.toString()),
                        subtitle: Text(posts[index].title ?? ''),
                        trailing: Text(posts[index].userId.toString()),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
