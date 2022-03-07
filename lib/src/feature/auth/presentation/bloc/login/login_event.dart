part of 'login_bloc.dart';

// enum AuthEvent {
//   initial,
//   login,
//   logout,
//   register,
//   resetPassword,
//   sendEmailVerification,
//   sendPasswordResetEmail,
//   signInWithGoogle,
//   signInWithFacebook,
//   signInWithEmailAndPassword,
//   signInWithPhoneNumber,
//   signInWithEmailLink,
//   signInWithCredential,
//   signInAnonymously,
//   signInWithCustomToken,
// }

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
