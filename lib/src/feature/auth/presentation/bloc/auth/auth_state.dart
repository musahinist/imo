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
  const AuthState({
    this.state = AuthStatus.initial,
  });

  @override
  List<Object> get props => [state];

  AuthState copyWith({
    AuthStatus? state,
  }) {
    return AuthState(
      state: state ?? this.state,
    );
  }
}
