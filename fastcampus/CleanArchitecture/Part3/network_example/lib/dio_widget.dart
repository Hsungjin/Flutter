import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:network_example/main.dart';

class DioWidget extends StatefulWidget {
  const DioWidget({super.key});

  @override
  State<DioWidget> createState() => _DioWidgetState();
}

class _DioWidgetState extends State<DioWidget> {
  final Dio dio = Dio();
  String responseText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        TextButton(
          onPressed: () async {
            final response = await dio.get(apiUrl);
            if (response.statusCode == 200) {
              setState(() {
                responseText = response.data.toString();
              });
            } else {
              setState(() {
                responseText = response.statusCode.toString();
              });
            }
          },
          child: Text('Dio Get'),
        ),
        TextButton(
          onPressed: () async {
            final response = await dio.post(
              apiUrl,
              options: Options(
                headers: {
                  'content-type': 'application/json',
                  "charset": "UTF-8",
                },
              ),
              data: {"title": "foo", "body": "bar", "userId": "1"},
            );
            if (response.statusCode == 201) {
              setState(() {
                responseText = response.data.toString();
              });
            } else {
              setState(() {
                responseText = response.statusCode.toString();
              });
            }
          },
          child: Text('Dio Post'),
        ),
        TextButton(
          onPressed: () async {
            final response = await dio.put(
              "$apiUrl/2",
              options: Options(
                headers: {
                  'content-type': 'application/json',
                  "charset": "UTF-8",
                },
              ),
              data: {"title": "foo2", "body": "bar2"},
            );
            if (response.statusCode == 200) {
              setState(() {
                responseText = response.data.toString();
              });
            } else {
              setState(() {
                responseText = response.statusCode.toString();
              });
            }
          },
          child: Text('Dio Put'),
        ),
        TextButton(
          onPressed: () async {
            final response = await dio.delete(
              "$apiUrl/2",
              options: Options(
                headers: {
                  'content-type': 'application/json',
                  "charset": "UTF-8",
                },
              ),
            );
            if (response.statusCode == 200) {
              setState(() {
                responseText = response.data.toString();
              });
            } else {
              setState(() {
                responseText = response.statusCode.toString();
              });
            }
          },
          child: Text('Dio Delete'),
        ),
        Divider(height: 1, color: Colors.grey),
        Expanded(child: SingleChildScrollView(child: Text(responseText))),
      ],
    );
  }
}
