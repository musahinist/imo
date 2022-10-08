import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imo/src/feature/auth/domain/user_repository.dart';

import '../../../../../core/http/dio_client.dart';
import '../../../data/source/token_repository_local.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepositoryImpl;
  final TokenRepositoryLocal _local;
  AuthBloc(this._local, this._userRepositoryImpl) : super(const AuthState()) {
    on<AuthChangedEvent>((event, emit) async {
      if (_local.hasToken()) {
        try {
          emit(state.copyWith(state: AuthStatus.authenticating));
          String token = _local.getToken();
          log(token);
          DioClient.token = token;
          final user = await _userRepositoryImpl.getUser();
          emit(state.copyWith(state: AuthStatus.authenticated, user: user));
        } catch (e) {
          emit(state.copyWith(state: AuthStatus.unauthenticated));
        }
      } else {
        emit(state.copyWith(state: AuthStatus.unauthenticated));
      }
    });
    on<SignOutEvent>((event, emit) async {
      DioClient.token = null;
      await _local.deleteToken();
      emit(state.copyWith(state: AuthStatus.unauthenticated));
    });
  }
}
