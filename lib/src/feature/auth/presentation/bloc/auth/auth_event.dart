part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthChangedEvent extends AuthEvent {
  final AuthStatus state;

  const AuthChangedEvent({this.state = AuthStatus.unauthenticated});
  @override
  List<Object> get props => [state];
}
