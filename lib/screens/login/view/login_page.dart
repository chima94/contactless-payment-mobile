import 'package:contactless_payment_app/dialog/loading_screen.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/domain/usecases/login_usecase.dart';
import 'package:contactless_payment_app/screens/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login__cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    final loginUsecase = LoginUseCase(context.read<UserRepository>());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (_) => LoginCubit(
          loginUseCase: loginUsecase,
        ),
        child: const LoginView(),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen.instance().show(context: context, text: 'Loading');
        } else if (state.errorMsg.isNotEmpty) {
          LoadingScreen.instance().hide();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMsg)));
        } else {
          LoadingScreen.instance().hide();
        }
      },
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: const [
          _EmailInput(),
          _passwordInput(),
          _LoginButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              onChanged: (email) =>
                  context.read<LoginCubit>().emailChanged(email),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          );
        });
  }
}

class _passwordInput extends StatelessWidget {
  const _passwordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextFormField(
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Password',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            obscureText: true,
            keyboardAppearance: Brightness.dark,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<LoginCubit>().login(),
      child: const Text('login'),
    );
  }
}
