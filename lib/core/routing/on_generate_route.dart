import 'package:flutter/material.dart';
import 'routes_strings.dart';
import '../../features/onboarding/ui/views/onboarding_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => Container());
    case RoutesStrings.onBoarding:
      return MaterialPageRoute(
        builder: (_) => OnboardingView(),
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
