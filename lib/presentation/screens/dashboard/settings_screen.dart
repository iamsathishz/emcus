import 'package:emcus_sathishkumar_r/core/constants/navigation/route_names.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_button.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_text.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_bloc.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_event.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Settings screen with a logout option.
/// Listens for authentication state changes and redirects user accordingly.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Navigate to login screen on logout
        if (state is Unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.login, (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Logout!")),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            "Settings",
            color: AppColors.white,
            fontSize: 35,
          ),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              text: "Logout",
              buttonWidth: 200,
              onTapped: () {
                // Dispatch logout event
                context.read<AuthBloc>().add(LoggedOut());
              },
            ),
          )
        ],
      ),
    );
  }
}
