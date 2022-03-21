import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../widget/loading_button.widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);
  static const String routeName = '/signIn';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(context.read(), context.read(), context.read()),
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: const _SignInBody()),
    );
  }
}

class _SignInBody extends StatelessWidget {
  const _SignInBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, login) {
          // if (login.authState == AuthStatus.signInError) {
          //   ScaffoldMessenger.of(context)
          //     ..hideCurrentSnackBar()
          //     ..showSnackBar(
          //       const SnackBar(content: Text('Authentication Failure')),
          //     );
          // }
        },
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        onChanged: (email) => context
                            .read<LoginBloc>()
                            .add(LoginEmailChanged(email)),
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        onChanged: (pass) => context
                            .read<LoginBloc>()
                            .add(LoginPasswordChanged(pass)),
                        decoration:
                            const InputDecoration(labelText: 'Passeord'),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return LoadingButtonWidget(
                            onPressed: () => context
                                .read<LoginBloc>()
                                .add(const LoginSubmitted()),
                            label: 'Sign In',
                            isLoading:
                                state.authState == AuthStatus.authenticating
                                    ? true
                                    : false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text('SignInView'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
