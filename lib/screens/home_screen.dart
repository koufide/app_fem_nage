
import 'package:app_fem_nage/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Home"),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<AuthProvider>(context,listen: false).signOut();
              Navigator.pushReplacementNamed(context, "/");
            },
              icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text('Bienvenu '),
      ),
    );
  }
}
