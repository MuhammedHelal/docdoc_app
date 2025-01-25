import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TermsAndDonotHaveAccount extends StatelessWidget {
  const TermsAndDonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By logging in, you agree to our ',
                style: TextStyles.grey14Normal,
              ),
              TextSpan(
                text: 'Terms of Service',
                style: TextStyles.black14Normal,
              ),
              TextSpan(
                text: ' and ',
                style: TextStyles.grey14Normal,
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyles.black14Normal,
              ),
            ],
          ),
        ),
        Gap(24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyles.black14Normal,
            ),
            TextButton(
              // style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {},
              child: Text(
                'Sign up',
                style: TextStyles.primary14Normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
