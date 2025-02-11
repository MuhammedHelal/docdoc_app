import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/border_styles.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/signup_widgets/confirm_password_text_field.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/signup_widgets/gender_button.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/signup_widgets/password_validations.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/signup_widgets/phone_number_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
// TODO : Complete the ui and refactor

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late final SignupCubit _cubit;
  bool _isObscure = true;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignupCubit>();
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
          const PasswordValidations(),
          Gap(16.h),
          const ConfirmPasswordTextField(),
          Gap(16.h),

          const PhoneNumberTextField(),
          Gap(16.h),

          const GenderButton(),

          //   const SignupButton(),
        ],
      ),
    );
  }
}
