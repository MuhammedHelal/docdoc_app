import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/login_footer.dart';
import 'package:flutter_advanced/features/auth/ui/widgets/login_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.primary24Bold,
              ),
              Gap(8.h),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.grey14Normal,
              ),
              Gap(36.h),
              const LoginForm(),
              Gap(16.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  // style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyles.primary14Normal,
                  ),
                ),
              ),
              Gap(41.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyles.white16W600,
                ),
              ),
              Gap(32.h),
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
