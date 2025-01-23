import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyles {
  static final black24W700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static final primary32Bold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static final primary24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final primary14Normal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
  );
  static final black14Normal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static final grey14Normal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );
  static final lighterGrey14W500 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lighterGrey,
  );

  static final white16Normal = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  static final white16W600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
