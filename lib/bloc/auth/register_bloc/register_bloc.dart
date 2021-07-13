import 'package:bloc/bloc.dart';
import 'package:meow_too/bloc/auth/form_submission_status.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_event.dart';
import 'package:meow_too/bloc/auth/register_bloc/register_state.dart';
import 'package:meow_too/repositories/users.repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _usersRepository;

  RegisterBloc({required userRepository})
    : _usersRepository = userRepository,
      super(RegisterState.initialState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {

    if (event is RegisterFirstNameChanged) {
      final firstName = event.firstName;
      yield this.state.copyWith(firstName: firstName);


    } else if (event is RegisterLastNameChanged) {
      final lastName = event.lastName;
      yield this.state.copyWith(lastName: lastName);

    } else if (event is RegisterEmailChanged) {
      final email = event.email;
      yield this.state.copyWith(email: email);

    } else if (event is RegisterPasswordChanged) {
      final password = event.password;
      yield this.state.copyWith(password: password);

    }
    else if (event is RegisterSubmitted) {
      yield this.state.copyWith(formStatus: FormSubmitting());

      try {
        await _usersRepository.register(
          state.firstName,
          state.lastName,
          state.email,
          state.password
        );
        const formStatus = SubmissionSuccess();
        yield state.copyWith(formStatus: formStatus);
        print("*************** STATE *********************");
        print(state.formStatus);
      } catch (error) {
        Exception e = new Exception(error);
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }




}