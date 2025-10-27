import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:freezed_example/freezed/freezed_product_model.dart';

void main() {
  runApp(const MainApp());
}

String jsonUrl = "https://dummyjson.com/products";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Hello World!')),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var response = await http.get(Uri.parse(jsonUrl));

            if (response.statusCode == 200) {
              List<dynamic> data = jsonDecode(response.body)['products'];
              for (var item in data) {
                print(FreezedProductModel.fromJson(item).toString());
                // print(ProductModel.fromJson(item).toJson());
              }
            } else {
              print('Error: ${response.statusCode}');
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
