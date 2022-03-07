import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/source/token_repository_local.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenRepositoryLocal _local = TokenRepositoryLocal();
  AuthBloc() : super(const AuthState()) {
    on<AuthChangedEvent>((event, emit) async {
      if (_local.hasToken()) {
        log(await _local.getToken());
        emit(state.copyWith(state: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(state: AuthStatus.unauthenticated));
      }
    });
  }
}
