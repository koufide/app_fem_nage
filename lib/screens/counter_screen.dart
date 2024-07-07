import 'package:app_fem_nage/providers/auth_provider.dart';
import 'package:app_fem_nage/providers/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _telController =
      TextEditingController(text: '0709327626');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456789');

  bool _isLoading = false;

  Future<void> _signIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String tel = _telController.text;
      String password = _passwordController.text;

      await Provider.of<AuthProvider>(context, listen: false)
          .signIn(tel, password);

      // context.read<CounterBloc>().add(CounterIncrementPressed()),

      setState(() {
        _isLoading = false;
      });

      if (Provider.of<AuthProvider>(context, listen: false).user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Login failed."),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COUNTER SCREEN'),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [
            MultiBlocListener(
              listeners: [
                BlocListener<CounterBloc, int>(
                  listenWhen: (previous, state) => true,
                  listener: (context, state) {
                    if (state % 5 == 0 && state != 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Compte est multiple de 5!')),
                      );
                    }
                  },
                ),
              ],
              child: BlocBuilder<CounterBloc, int>(
                buildWhen: (previousState, state) {
                  return true;
                },
                builder: (context, count) {
                  //return Text('Valeur du compteur $count');
                  return Padding(
                    padding: const EdgeInsets.all(16.0.dp),
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
                              if (value == null || value.isEmpty) {
                                return 'Merci de saisir votre numero de Telephone ';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: '$count',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Merci de saisir votre mot de passe';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () => _signIn(context),
                                  child: Text('Login $count'),
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(CounterIncrementPressed());
        },
        tooltip: 'Augmenter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
