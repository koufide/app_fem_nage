
import 'package:app_fem_nage/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  final AuthService _authService = AuthService();
   Map<String, dynamic>? _user;

  Map<String, dynamic>? get user => _user;

  Future<void> signIn(String tel, String password) async{
    _user = (await _authService.signIn(tel, password))!;
    notifyListeners();
  } // signIn

  Future<void> signOut() async{
     _authService.signOut();
     _user = null;
    notifyListeners();
  } // signIn

}