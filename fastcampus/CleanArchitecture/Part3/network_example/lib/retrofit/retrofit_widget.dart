import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:network_example/retrofit/post_api.dart';

class RetrofitWidget extends StatefulWidget {
  const RetrofitWidget({super.key});

  @override
  State<RetrofitWidget> createState() => _RetrofitWidgetState();
}

class _RetrofitWidgetState extends State<RetrofitWidget> {
  Dio dio = Dio();
  String responseText = "";
  late PostApi postApi;

  @override
  void initState() {
    super.initState();
    postApi = PostApi(dio);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        TextButton(
          onPressed: () async {
            postApi.getPosts().then((value) {
              setState(() {
                responseText = value.data.toString();
              });
            });
          },
          child: Text('Retrofit Get'),
        ),
        TextButton(
          onPressed: () {
            postApi
                .createPost({"title": "foo", "body": "bar", "userId": "1"})
                .then((value) {
                  setState(() {
                    responseText = value.data.toString();
                  });
                });
          },
          child: Text('Retrofit Post'),
        ),
        TextButton(
          onPressed: () {
            postApi.updatePost(1, {"title": "foo2", "body": "bar2"}).then((
              value,
            ) {
              setState(() {
                responseText = value.data.toString();
              });
            });
          },
          child: Text('Retrofit Update'),
        ),
        TextButton(
          onPressed: () {
            postApi.deletePost(1).then((value) {
              setState(() {
                responseText = value.data.toString();
              });
            });
          },
          child: Text('Retrofit Delete'),
        ),
        Divider(height: 1, color: Colors.grey),
        Expanded(child: SingleChildScrollView(child: Text(responseText))),
      ],
    );
  }
}
