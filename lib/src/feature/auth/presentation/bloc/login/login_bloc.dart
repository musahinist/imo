import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/transformers.dart';

import '../../../../../app.dart';
import '../../../../../core/http/http_exception.dart';
import '../../../data/source/token_repository_local.dart';
import '../../../domain/auth_repository.dart';
import '../auth/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  final TokenRepositoryLocal _local;
  final AuthBloc _authBloc;
  LoginBloc(this._authRepository, this._local, this._authBloc)
      : super(const LoginState()) {
    on<LoginEmailChanged>(
      _onUsernameChanged,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
    on<LoginPasswordChanged>(
      _onPasswordChanged,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
    on<LoginSubmitted>(_onSubmitted);
  }
  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
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
      final String token =
          await _authRepository.login(state.email, state.password);

      _local.saveToken(token);
      _authBloc.add(const AuthChangedEvent());
      emit(state.copyWith(authState: AuthStatus.signInSuccess));
    } catch (e) {
      emit(state.copyWith(authState: AuthStatus.signInError));
      scaffoldMessengerKey.currentState!
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(DataException.handleError(e)),
          ),
        );
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
