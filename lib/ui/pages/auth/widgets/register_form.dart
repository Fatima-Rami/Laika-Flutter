import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_too/bloc/auth/form_submission_status.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_bloc.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_event.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_state.dart';
import 'package:meow_too/ui/pages/auth/widgets/email_field.dart';
import 'package:meow_too/ui/pages/auth/widgets/lastname_field.dart';
import 'package:meow_too/ui/pages/auth/widgets/password_field.dart';

import 'firstname_field.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
            print('inscription non validée');
          } else if (formStatus is SubmissionSuccess){
            Navigator.of(context).pushNamed("/");
          }
        },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FirstnameField(),
              LastnameField(),
              EmailField(),
              PasswordField(),
              _registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<RegisterBloc>().add(RegisterSubmitted());
          }
        },
        child: Text('Inscription'),
      );
    });
  }


}
