import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class ApiClient {
  Future<Response> postRequest({
    required String url,
    required Map body,
  }) async {
    print("url $url");
    print("body $body");
    var client = https.Client();
    var uri = Uri.parse(url);
    var response = await client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return response;
  }
}
