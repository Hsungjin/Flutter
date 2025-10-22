import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

String jsonUrl = 'https://jsonplaceholder.typicode.com/posts';

final postFutureProvider = FutureProvider.autoDispose((ref) async {
  final response = await http.get(Uri.parse('${jsonUrl}/1'));
  if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  }
});
