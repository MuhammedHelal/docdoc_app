import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/consts/assets.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Assets.svgsAppLogoLowOpacity,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(0),
              ],
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(Assets.imagesOnboardingDoctor),
        ),
        Positioned(
          bottom: 30,
          child: Text(
            'Mohamed Ashraf`s\nAppointment App',
            style: TextStyles.primary32Bold.copyWith(
              height: 1.4,
            ),
          ),
        )
      ],
    );
  }
}
