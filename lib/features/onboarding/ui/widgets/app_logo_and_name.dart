import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/consts/assets.dart';

class AppLogoAndName extends StatelessWidget {
  const AppLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsAppLogo),
        Gap(10.w),
        Text(
          'DocDoc',
          style: TextStyles.black24W700,
        ),
      ],
    );
  }
}
