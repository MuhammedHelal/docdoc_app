import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/DI/locator.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_advanced/features/auth/ui/views/login_view.dart';
import 'package:flutter_advanced/features/home/ui/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/onboarding/ui/views/onboarding_view.dart';
import 'routes_strings.dart';

// comment
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(builder: (_) => Container());
    case RoutesStrings.onBoarding:
      return MaterialPageRoute(
        builder: (_) => const OnboardingView(),
      );
    case RoutesStrings.home:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
      );
    case RoutesStrings.login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => locator<LoginCubit>(),
          child: const LoginView(),
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route found for ${settings.name}'),
          ),
        ),
      );
  }
}
