part of 'login_bloc.dart';

enum AuthEvent {
  initial,
  login,
  logout,
  register,
  resetPassword,
  sendEmailVerification,
  sendPasswordResetEmail,
  signInWithGoogle,
  signInWithFacebook,
  signInWithEmailAndPassword,
  signInWithPhoneNumber,
  signInWithEmailLink,
  signInWithCredential,
  signInAnonymously,
  signInWithCustomToken,
}

abstract class Auth extends Equatable {
  const Auth();

  @override
  List<Object> get props => [];
}

class LoginEvent extends Auth {
  final bool hasToken;
  const LoginEvent(this.hasToken);

  @override
  List<Object> get props => [];
}

class LogOutEvent extends Auth {
  const LogOutEvent();

  @override
  List<Object> get props => [];
}
