import 'dart:async';
import 'package:emcus_sathishkumar_r/core/constants/assets/app_png_assets.dart';
import 'package:emcus_sathishkumar_r/core/constants/navigation/route_names.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_gradients.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_bloc.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_event.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Splash screen that appears briefly on app launch and checks authentication status.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 1 second and trigger the AppStarted event to check auth status.
    Timer(const Duration(seconds: 1), () {
      context.read<AuthBloc>().add(AppStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Navigate based on authentication state.
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, RouteNames.dashboard);
        } else if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, RouteNames.login);
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Stack(
            children: [
              Row(
                children: [
                  // Left side gradient
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppGradients.splashScreenGradient,
                      ),
                    ),
                  ),

                  // Right side solid color with logo
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: AppColors.primaryColor,
                      child: Center(
                        child: Image.asset(
                          AppPngAssets.splashLogo,
                          width: size.width / 2,
                          height: size.height * 0.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Positioned CCTV Image
              Positioned(
                top: size.height * 0.3,
                left: 0,
                child: Image.asset(AppPngAssets.cctvImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
