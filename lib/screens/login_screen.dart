import 'package:app_fem_nage/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _telController = TextEditingController(text: '0709327626');
  final TextEditingController _passwordController = TextEditingController(text: '123456789');

  bool _isLoading = false;

  Future<void> _signIn(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });

      String tel = _telController.text;
      String password = _passwordController.text;

      await Provider.of<AuthProvider>(context, listen: false).signIn(tel, password);
      setState(() {
      _isLoading = false;
      });

      if(Provider.of<AuthProvider>(context, listen: false).user != null){
      Navigator.pushReplacementNamed(context, '/home');

      }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login failed."),
        )
      );

      }


    }
  }


  //TODO FLUTTER SIZE A IMPLEMENTER
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _telController,
                decoration: const InputDecoration(
                  labelText: 'Telephone',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Merci de saisir votre numero de Telephone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password',),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Merci de saisir votre mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              _isLoading ? const CircularProgressIndicator(): ElevatedButton(
                  onPressed: ()=> _signIn(context),
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
