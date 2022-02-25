part of 'login_bloc.dart';

enum AuthState {
  initial,
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

class LoginState extends Equatable {
  final AuthState authState;
  const LoginState(this.authState);

  @override
  List<Object> get props => [authState];
}
