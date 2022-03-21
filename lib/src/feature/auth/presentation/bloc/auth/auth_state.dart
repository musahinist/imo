part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  validation,
  authenticating,
  authenticated,
  unauthenticated,
  signInError,
  signUpError,
  signOutError,
  signInSuccess,
  signUpSuccess,
  signOutSuccess,
}

class AuthState extends Equatable {
  final AuthStatus state;
  final Map? user;
  const AuthState({
    this.state = AuthStatus.initial,
    this.user,
  });

  @override
  List<Object> get props => [state];

  AuthState copyWith({
    AuthStatus? state,
    Map? user,
  }) {
    return AuthState(
      state: state ?? this.state,
      user: user ?? this.user,
    );
  }
}
