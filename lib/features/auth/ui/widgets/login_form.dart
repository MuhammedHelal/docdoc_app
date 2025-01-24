import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginCubit _loginCubit;
  bool _isObscure = true;
  @override
  void initState() {
    super.initState();
    _loginCubit = context.read<LoginCubit>();
  }

  @override
  void dispose() {
    _loginCubit.emailController.dispose();
    _loginCubit.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginCubit.formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => _loginCubit.validateEmail(value),
            //   validator: validateEmail,
            controller: _loginCubit.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          Gap(16.h),
          TextFormField(
            controller: _loginCubit.passwordController,
            onChanged: (value) => _loginCubit.validatePassword(value),
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: const Icon(
                    Icons.visibility_outlined,
                  ),
                ),
              ),
            ),
            obscureText: _isObscure,
            // validator: ,
          ),
          Gap(16.h),
          const PasswordValidations(),
        ],
      ),
    );
  }
}
