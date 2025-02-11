import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/border_styles.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginCubit _cubit;
  bool _isObscure = true;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<LoginCubit>();
  }

  @override
  void dispose() {
    _cubit.emailController.dispose();
    _cubit.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _cubit.formKey,
      child: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _cubit.emailValid,
            builder: (context, value, child) {
              return TextFormField(
                onChanged: (value) => _cubit.validateEmail(value),
                //   validator: validateEmail,
                controller: _cubit.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  focusedBorder: value
                      ? BorderStyles.greenOutlinedInputBorder
                      : BorderStyles.redOutlinedInputBorder,
                  enabledBorder: value
                      ? BorderStyles.greenOutlinedInputBorder
                      : BorderStyles.redOutlinedInputBorder,
                ),
              );
            },
          ),
          Gap(16.h),
          ValueListenableBuilder(
            valueListenable: _cubit.passwordValid,
            builder: (context, value, child) {
              return TextFormField(
                controller: _cubit.passwordController,
                onChanged: (value) => _cubit.validatePassword(value),
                decoration: InputDecoration(
                  focusedBorder: value
                      ? BorderStyles.greenOutlinedInputBorder
                      : BorderStyles.redOutlinedInputBorder,
                  enabledBorder: value
                      ? BorderStyles.greenOutlinedInputBorder
                      : BorderStyles.redOutlinedInputBorder,
                  labelText: 'Password',
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: const Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
                obscureText: _isObscure,
                // validator: ,
              );
            },
          ),
          Gap(16.h),
          // TODO :: Refactor this and make it work
          //   const PasswordValidations(),
        ],
      ),
    );
  }
}
