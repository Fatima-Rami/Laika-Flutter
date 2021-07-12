import 'package:equatable/equatable.dart';
import 'package:meow_too/model/user.model.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent{}

class UserLoggedIn extends AuthenticationEvent {
  final String token;

  UserLoggedIn({required this.token});
}

class UserLoggedOut extends AuthenticationEvent {}