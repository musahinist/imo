import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:imo/src/feature/auth/domain/auth_repository.dart';

import '../auth/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  final AuthBloc _authBloc;
  LoginBloc(this._authRepository, this._authBloc) : super(const LoginState()) {
    on<LoginEmailChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }
  void _onUsernameChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    //  final username = Username.dirty(event.username);
    emit(state.copyWith(email: event.email, authState: AuthStatus.validation));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    // final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: event.password, authState: AuthStatus.validation));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(authState: AuthStatus.authenticating));
      await Future.delayed(const Duration(seconds: 2));
      await _authRepository.login(state.email, state.password);
      emit(state.copyWith(authState: AuthStatus.signInSuccess));
      _authBloc.add(const AuthChangedEvent(state: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(authState: AuthStatus.signInError));
    }
    // if (state.status.isValidated) {
    //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
    //   try {
    //     await _authenticationRepository.logIn(
    //       username: state.username.value,
    //       password: state.password.value,
    //     );
    //     emit(state.copyWith(status: FormzStatus.submissionSuccess));
    //   } catch (_) {
    //     emit(state.copyWith(status: FormzStatus.submissionFailure));
    //   }
    // }
  }
}
