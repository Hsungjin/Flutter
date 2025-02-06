import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> papago(String text, String targetLanguage) async {
  String _clientId = '발급받은 Client ID';
  String _clientSecret = '발급받은 Client Secret';
  String _contentType = 'application/json';
  String _url = 'https://naveropenapi.apigw.ntruss.com/nmt/v1/translation';

  Map<String, String> headers = {
    'X-NCP-APIGW-API-KEY-ID': _clientId,
    'X-NCP-APIGW-API-KEY': _clientSecret,
    'Content-Type': _contentType,
  };

  Map<String, String> data = {
    'source': 'ko',
    'target': targetLanguage,
    'text': text,
  };

  var response = await http.post(Uri.parse(_url), headers: headers, body: jsonEncode(data));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    return jsonData['message']['result']['translatedText'];
  } else {
    return 'Error: ${response.statusCode}';
  }
}
