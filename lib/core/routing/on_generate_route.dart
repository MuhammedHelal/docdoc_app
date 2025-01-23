import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/auth/ui/views/login_view.dart';

import '../../features/onboarding/ui/views/onboarding_view.dart';
import 'routes_strings.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => Container());
    case RoutesStrings.onBoarding:
      return MaterialPageRoute(
        builder: (_) => OnboardingView(),
      );

    case RoutesStrings.login:
      return MaterialPageRoute(
        builder: (_) => LoginView(),
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
