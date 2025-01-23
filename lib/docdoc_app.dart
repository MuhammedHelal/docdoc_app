import 'package:flutter/material.dart';
import 'core/routing/on_generate_route.dart';
import 'core/routing/routes_strings.dart';
import 'core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
      ),
    );
  }
}
