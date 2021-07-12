import 'package:equatable/equatable.dart';

import '../form_submission_status.dart';

class RegisterState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;

  bool get isValidEmail => email.contains("@");
  final String password;

  bool get isValidPassword => password.length > 6;
  final FormSubmissionStatus formStatus;

  RegisterState(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.formStatus = const InitialFormStatus()});

  static RegisterState initialState() =>
  RegisterState(firstName: "", lastName: "", email: "", password: "");


  RegisterState copyWith(
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      FormSubmissionStatus? formStatus}) {
    return RegisterState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object> get props => [firstName, lastName, email, password];
}
