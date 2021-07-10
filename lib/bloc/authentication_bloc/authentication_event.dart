import 'package:equatable/equatable.dart';
import 'package:meow_too/model/user.model.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent{}

class UserLoggedIn extends AuthenticationEvent {
  final User user;

  UserLoggedIn({required this.user});
}

class UserLoggedOut extends AuthenticationEvent {}