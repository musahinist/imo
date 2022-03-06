import 'package:imo/src/feature/auth/presentation/bloc/login/login_bloc.dart';

abstract class AuthRepository {
  login(String email, String pass);
}
