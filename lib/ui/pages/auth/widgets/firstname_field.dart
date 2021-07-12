import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_bloc.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_event.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_state.dart';

class FirstnameField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: 'Nom'
            ),

            onChanged: (value) => context.read<RegisterBloc>().add(RegisterFirstNameChanged(firstName: value)),
          );
        });
  }
}
