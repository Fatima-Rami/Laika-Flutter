import 'package:bloc/bloc.dart';
import 'package:meow_too/repositories/users.repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UsersRepository usersRepository;

  AuthenticationBloc({required this.usersRepository}) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }


  
}