import 'dart:convert';

import 'package:app_fem_nage/models/session.dart';
import 'package:app_fem_nage/models/user.dart';
import 'package:app_fem_nage/rest/backend_service.dart';
import 'package:http/http.dart';

class BackendRestService extends BackendService {
  static const String BASE_URL =
      "https://srv-api-nodejs--srv-nodejs.us-central1.hosted.app";
  static const String API_URL = "$BASE_URL/users/user";

  @override
  Future<Session?> signIn(
      {required String mobile, required String password}) async {
    final Uri url = Uri.parse("$API_URL/$mobile/$password");
    // final Response response = await post(url, body: <String, String>{"email": mobile, "password": password});

    final Response response = await get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      // Vérifier si la liste n'est pas vide
      if (jsonData.isNotEmpty) {
        return Session.fromJson(jsonData[0]);
      } else {

        // throw Exception('No users found');
        // final List<dynamic> jsonData = jsonDecode('{}');
        // return Session.fromJson(jsonData[0]);
        // return Session.fromJson(jsonData[0]);
        // return [];
        return null;
      }
    } else if (response.statusCode == 401 &&
        response.headers['content-type'] == "application/json") {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final String message =
          json.containsKey("message") ? json['message'] : "Unauthorized";
      throw Exception(message);
    } else {
      throw Exception('Failed to sign in: ${response.body}');
    }
  } //signIn
} //BackendRestService
