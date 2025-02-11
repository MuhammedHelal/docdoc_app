import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/signup_widgets/signup_bloc_listener.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/signup_widgets/signup_form.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/terms_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/signup_widgets/already_have_account.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignupBlocListener(),
              Text(
                'Create Account',
                style: TextStyles.primary24Bold,
              ),
              Gap(8.h),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.grey14Normal,
              ),
              Gap(36.h),
              const SignupForm(),
              Gap(16.h),
              const TermsWidget(),
              Gap(24.h),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      )),
    );
  }
}
