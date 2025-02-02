import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_advanced/features/onboarding/ui/widgets/doctor_image_and_text.dart';
import 'package:flutter_advanced/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/app_logo_and_name.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                const AppLogoAndName(),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.grey14Normal,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Gap(30.h),
                const GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
