import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_bloc.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_event.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_state.dart';

class PasswordField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Mot de passe'
            ),
            onChanged: (value) => context.read<RegisterBloc>().add(RegisterPasswordChanged(password: value)),
          );
        });
  }
}