import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/auth/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = context.read<LoginCubit>();

    return ValueListenableBuilder(
      valueListenable: cubit.shouldLoginButtonWork,
      builder: (context, value, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: value
              ? () {
                  cubit.emitLoginState(
                    LoginRequestBody(
                      email: cubit.emailController.text,
                      password: cubit.passwordController.text,
                    ),
                  );
                }
              : null,
          child: const Text('Login'),
        );
      },
    );
  }
}
