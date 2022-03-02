import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<Auth, LoginState> {
  LoginBloc() : super(const LoginState(AuthState.initial)) {
    on<LoginEvent>((event, emit) async {
      emit(const LoginState(AuthState.authenticating));
      await Future.delayed(const Duration(seconds: 2));

      /// check token on the local storage
      /// if token is valid, emit LoginState.authenticated
      bool hasToken = event.hasToken;

      /// else emit LoginState.authenticationFailed
      hasToken
          ? emit(const LoginState(AuthState.authenticated))
          : emit(const LoginState(AuthState.unauthenticated));
    });
    on<LogOutEvent>((event, emit) async {
      emit(const LoginState(AuthState.authenticating));
      await Future.delayed(const Duration(seconds: 2));
      emit(const LoginState(AuthState.unauthenticated));
    });
  }
}
