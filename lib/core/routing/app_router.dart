import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/di/dependency_injection.dart';
import 'package:flutter_complete_proj/core/routing/routes.dart';
import 'package:flutter_complete_proj/features/home/ui/home_screen.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_proj/features/login/ui/login_screen.dart';
import 'package:flutter_complete_proj/features/onboarding/onboarding_screen.dart';

class AppRouter 
{
  Route generateRoute(RouteSettings settings) {
    //arguments used to pass data from one screen to another
    final arguments=settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}