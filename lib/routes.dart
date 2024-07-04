


import 'package:app_fem_nage/screens/home_screen.dart';
import 'package:app_fem_nage/screens/login_screen.dart';
import 'package:app_fem_nage/screens/profile_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  // '/': (context) => const HomeScreen(),
  '/': (context) => const LoginScreen(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/profile': (context) => const ProfileScreen(),
};