import 'package:flutter/material.dart';
import 'package:meow_too/ui/pages/auth/widgets/register_form.dart';

class RegistrationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            RegisterForm(),
            // TODO mettre login button
          ],
        ),
    );
  }
}
