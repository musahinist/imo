import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<Auth, LoginState> {
  LoginBloc() : super(const LoginState(AuthState.initial)) {
    on<LoginEvent>((event, emit) async {
      emit(const LoginState(AuthState.authenticating));
      await Future.delayed(const Duration(seconds: 2));
      emit(const LoginState(AuthState.authenticated));
    });
    on<LogOutEvent>((event, emit) async {
      emit(const LoginState(AuthState.authenticating));
      await Future.delayed(const Duration(seconds: 2));
      emit(const LoginState(AuthState.unauthenticated));
    });
  }
}
