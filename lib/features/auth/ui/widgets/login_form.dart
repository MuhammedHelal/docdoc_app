import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          Gap(16.h),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: const Icon(
                  Icons.visibility_outlined,
                ),
              ),
            ),
            obscureText: true,
            validator: (value) =>
                value!.isEmpty ? "Password can't be empty" : null,
          ),
        ],
      ),
    );
  }
}
