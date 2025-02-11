import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/DI/locator.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/auth/ui/views/login_view.dart';
import 'package:flutter_advanced/features/auth/ui/views/signup_view.dart';
import 'package:flutter_advanced/features/home/ui/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes_strings.dart';

// comment
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case '/':
    //   return MaterialPageRoute<dynamic>(builder: (_) => Container());
    // case RoutesStrings.onBoarding:
    //   return MaterialPageRoute(
    //     builder: (_) => const OnboardingView(),
    //   );
    case RoutesStrings.home:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
      );
    // case RoutesStrings.login:
    case '/':
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => locator<LoginCubit>(),
          child: const LoginView(),
        ),
      );
    case RoutesStrings.signup:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => locator<SignupCubit>(),
          child: const SignupView(),
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
