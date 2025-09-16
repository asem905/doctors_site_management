import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/routing/routes.dart';
import 'package:flutter_complete_proj/features/login/ui/widgets/login_screen.dart';
import 'package:flutter_complete_proj/features/onboarding/onboarding_screen.dart';

class AppRouter 
{
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}