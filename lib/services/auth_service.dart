import 'dart:convert';

import 'package:http/http.dart' as http;

//CREER UNE CONSTANTE POUR LA BASE URL
class AuthService {
  // final String baseUrl = 'http://localhost:3000';
  final String baseUrl = 'http://10.225.83.66:3000';

  Future<Map<String, dynamic>?> signIn(String tel, String password) async {
    try {
      print("==> AuthService.signIn ==> $tel $password");
      Uri url = Uri.parse('$baseUrl/users?tel=$tel&password=$password');

      final response = await http.get(url);
      print("==> AuthService.signIn ==> response");

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);
        if (users.isNotEmpty) {
          print("==> AuthService.signIn =>> $users.first");
          return users.first;
        }
      }else{
        print("==> AuthService.signIn =>> $response.statusCode ");
      }
      return null;
    } catch (e) {
      print("==> AuthService.signIn =>> ");
      print(e.toString());
      return null;
    }
  } // signIn

  void signOut() {
    // return null;
  }
} //AuthService
