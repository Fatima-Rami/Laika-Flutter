import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_bloc.dart';
import 'package:meow_too/repositories/users.repository.dart';
import 'package:meow_too/ui/pages/auth/registration_page.dart';
import 'package:meow_too/ui/pages/auth/widgets/register_form.dart';
import 'package:meow_too/ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc(userRepository: UserRepository()),
        child: RegisterForm(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple[100],
        ),
        routes: {
          "/":(context)=>HomePage(),
          "/register":(context)=>RegistrationPage(),
        },
      ),
    );
  }
}

