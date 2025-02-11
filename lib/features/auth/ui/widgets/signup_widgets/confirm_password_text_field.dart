import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/border_styles.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/validate_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField({super.key});

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool _isObscure = true;
  late final SignupCubit _cubit;
  bool isValid = false;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignupCubit>();
    _cubit.passwordController.addListener(passwordControllerListener);
    _cubit.confirmPasswordController.addListener(passwordControllerListener);
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.passwordController.removeListener(passwordControllerListener);
    _cubit.confirmPasswordController.removeListener(passwordControllerListener);
  }

  void passwordControllerListener() {
    final pass = _cubit.passwordController.text,
        confirmPass = _cubit.confirmPasswordController.text;
    if (pass.isEmpty || confirmPass.isEmpty) {
      isValid = false;
      setState(() {});

      return;
    }
    setState(() {
      isValid = pass == confirmPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _cubit.confirmPasswordController,
          onChanged: (_) => _cubit.validateConfirmPassword(),
          decoration: InputDecoration(
            focusedBorder: isValid
                ? BorderStyles.greenOutlinedInputBorder
                : BorderStyles.redOutlinedInputBorder,
            enabledBorder: isValid
                ? BorderStyles.greenOutlinedInputBorder
                : BorderStyles.redOutlinedInputBorder,
            labelText: 'Confirm Password',
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
        ),
        Gap(8.h),
        ValidationRow(
          title: 'Passwords match',
          isValid: isValid,
        ),
      ],
    );
  }
}
