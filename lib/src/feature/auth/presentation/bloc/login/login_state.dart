part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final AuthStatus authState;
  final String email;
  final String password;
  const LoginState({
    this.authState = AuthStatus.initial,
    this.email = '',
    this.password = '',
  });

  @override
  List<Object> get props => [email, password, authState];

  LoginState copyWith({
    AuthStatus? authState,
    String? email,
    String? password,
  }) {
    return LoginState(
      authState: authState ?? this.authState,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
