import 'dart:convert';

import 'package:http/http.dart' as http;

//CREER UNE CONSTANTE POUR LA BASE URL
class AuthService {
  // final String baseUrl = 'http://localhost:3000';
  final String baseUrl = 'http://0.0.0.0:3000';
  // final String baseUrl = 'http://10.225.83.66:3000';

  final response = null;

  Future<Map<String, dynamic>?> signIn(String tel, String password) async {
    try {
      print("==> AuthService.signIn ==> $tel $password");
      Uri url = Uri.parse('$baseUrl/users?tel=$tel&password=$password');

      final response = await http.get(url);
      print("==> AuthService.signIn ==> response ${response.body}");

      // if (response.statusCode == 200) {
        final List jsonUsers = jsonDecode(response.body);
        if(jsonUsers.isNotEmpty){
          final Map<String,dynamic> jsonUser =jsonUsers.first;
        print("==> AuthService.signIn ==> jsonUser $jsonUser");
          return jsonUser;
        }
        // jsonDecode(response.body);


        // if (users.isNotEmpty) {
          // print("==> AuthService.signIn =>> $users.first");
          return null;
          // return users.first;
        // }
      // }else{
      //   print("==> AuthService.signIn =>> $response.statusCode ");
      // }
      return null;
    } catch (e) {
      print("==> AuthService.signIn Erreur =>> ");
      // print("==> AuthService.signIn Response =>> $response");
      // print(e.toString());
      print(e);
      return null;
    }
  } // signIn

  void signOut() {
    // return null;
  }
} //AuthService
