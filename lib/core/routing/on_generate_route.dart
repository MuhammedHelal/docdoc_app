import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/auth/ui/views/login_view.dart';

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

    case RoutesStrings.login:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
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
