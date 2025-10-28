import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_example/main.dart';

class HttpWidget extends StatefulWidget {
  const HttpWidget({super.key});

  @override
  State<HttpWidget> createState() => _HttpWidgetState();
}

class _HttpWidgetState extends State<HttpWidget> {
  String responseText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        TextButton(
          onPressed: () async {
            final response = await http.get(Uri.parse(apiUrl));
            if (response.statusCode == 200) {
              setState(() {
                responseText = response.body;
              });
            } else {
              setState(() {
                responseText = 'Failed to load data';
              });
            }
          },
          child: Text('HTTP Get'),
        ),
        TextButton(
          onPressed: () async {
            final response = await http.post(
              Uri.parse(apiUrl),
              headers: {'content-type': 'application/json', "charset": "UTF-8"},
              body: jsonEncode({"title": "foo", "body": "bar", "userId": "1"}),
            );
            if (response.statusCode == 201) {
              setState(() {
                responseText = response.body;
              });
            } else {
              setState(() {
                responseText = response.statusCode.toString();
              });
            }
          },
          child: Text('HTTP Post'),
        ),
        TextButton(
          onPressed: () async {
            http
                .put(
                  Uri.parse("$apiUrl/2"),
                  headers: {
                    'content-type': 'application/json',
                    "charset": "UTF-8",
                  },
                  body: jsonEncode({"title": "foo2", "body": "bar2"}),
                )
                .then((value) {
                  if (value.statusCode == 200) {
                    setState(() {
                      responseText = value.body;
                    });
                  } else {
                    setState(() {
                      responseText = value.statusCode.toString();
                    });
                  }
                });
          },
          child: Text('HTTP Put'),
        ),
        TextButton(
          onPressed: () {
            http.delete(Uri.parse("$apiUrl/2")).then((value) {
              if (value.statusCode == 200) {
                setState(() {
                  responseText = value.body;
                });
              } else {
                setState(() {
                  responseText = value.statusCode.toString();
                });
              }
            });
          },
          child: Text('HTTP Delete'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              responseText = '';
            });
          },
          child: Text('Clear'),
        ),

        Divider(),
        Expanded(child: SingleChildScrollView(child: Text(responseText))),
      ],
    );
  }
}
