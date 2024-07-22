import 'dart:convert';

import 'package:app_fem_nage/models/session.dart';
import 'package:app_fem_nage/rest/backend_service.dart';
import 'package:http/http.dart';

class BackendRestService extends BackendService {
  static const String BASE_URL = "https://api-socialapp.adjemincloud.com";
  static const String API_URL = "$BASE_URL/api/v1";

  @override
  Future<Session> signIn({
        required String mobile, required String password
      }) async {
    final Uri url = Uri.parse("$API_URL/user_auth");
    final Response response = await post(url,
        body: <String, String>{"email": mobile, "password": password});

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json.containsKey('success') &&
          json['success'] == true &&
          json.containsKey("data") &&
          json['data'] != null) {
        final Map<String, dynamic> jsonData = json['data'];
        return Session.fromJson(jsonData);
      }
      throw Exception(response.body);
    } else if (response.statusCode == 401 &&
        response.headers['content-type'] == "application/json") {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final String message =
          json.containsKey("message") ? json['message'] : "Unauthoried";
      // throw AuthException(message);
    } else {
      throw Exception(response.body);
    }
  } //signIn
} //BackendRestService
