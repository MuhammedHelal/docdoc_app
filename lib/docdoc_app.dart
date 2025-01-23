import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/on_generate_route.dart';
import 'core/routing/routes_strings.dart';
import 'core/theming/colors.dart';

class DocdocApp extends StatelessWidget {
  const DocdocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: RoutesStrings.onBoarding,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            iconColor: AppColors.primary,
            suffixIconColor: AppColors.primary,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorStyle: const TextStyle(color: Colors.red),
            labelStyle: TextStyles.lighterGrey14W500,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.lighterGrey),
            ),
            fillColor: Colors.grey[50],
            filled: true,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          useMaterial3: true,
          iconTheme: const IconThemeData(color: AppColors.primary),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(double.infinity, 50),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
