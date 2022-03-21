part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthChangedEvent extends AuthEvent {
  const AuthChangedEvent();
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}
