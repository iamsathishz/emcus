import 'package:emcus_sathishkumar_r/presentation/screens/auth/login_screen.dart';
import 'package:emcus_sathishkumar_r/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:emcus_sathishkumar_r/presentation/screens/auth/register_screen.dart';
import 'package:emcus_sathishkumar_r/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());

      // Add more cases here

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}
