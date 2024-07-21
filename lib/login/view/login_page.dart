import 'package:app_fem_nage/login/bloc/login_bloc.dart';
import 'package:app_fem_nage/login/view/login_form.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route(){
    return MaterialPageRoute(builder: (_) => const LoginPage() );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding:  EdgeInsets.all(12.dp),
        child: BlocProvider(
            create: (context) {
              return LoginBloc(authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context));
            },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
