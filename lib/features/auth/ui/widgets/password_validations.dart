import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/regex.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PasswordValidations extends StatefulWidget {
  const PasswordValidations({super.key});

  @override
  State<PasswordValidations> createState() => _PasswordValidationsState();
}

class _PasswordValidationsState extends State<PasswordValidations> {
  late final LoginCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<LoginCubit>();
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

class ValidationRow extends StatelessWidget {
  const ValidationRow({super.key, required this.title, required this.isValid});
  final String title;
  final bool isValid;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
        ),
        Gap(5.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            overflow: TextOverflow.ellipsis,
            decoration:
                isValid ? TextDecoration.lineThrough : TextDecoration.none,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 1,
            decorationColor: Colors.grey,
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
