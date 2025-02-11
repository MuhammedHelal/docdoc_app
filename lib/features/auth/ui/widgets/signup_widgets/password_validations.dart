import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/regex.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/validate_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordValidations extends StatefulWidget {
  const PasswordValidations({super.key});

  @override
  State<PasswordValidations> createState() => _PasswordValidationsState();
}

class _PasswordValidationsState extends State<PasswordValidations> {
  late final SignupCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<SignupCubit>();
    cubit.passwordController.addListener(
      () {
        final pass = cubit.passwordController.text;
        setState(() {
          hasMinLength = pass.length >= 8;
          hasUpperCase = AppRegex.hasUpperCase(pass);
          hasLowerCase = AppRegex.hasLowerCase(pass);
          hasNumber = AppRegex.hasNumber(pass);
          hasSpecialCharacter = AppRegex.hasSpecialCharacter(pass);
        });
      },
    );
  }

  bool hasMinLength = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValidationRow(
          title: 'At least 8 characters',
          isValid: hasMinLength,
        ),
        ValidationRow(
          title: 'At least 1 uppercase letter',
          isValid: hasUpperCase,
        ),
        ValidationRow(
          title: 'At least 1 lowercase letter',
          isValid: hasLowerCase,
        ),
        ValidationRow(
          title: 'At least 1 number',
          isValid: hasNumber,
        ),
        ValidationRow(
          title: 'At least 1 special character',
          isValid: hasSpecialCharacter,
        ),
      ],
    );
  }
}
