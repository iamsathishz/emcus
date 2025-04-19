import 'package:emcus_sathishkumar_r/core/constants/navigation/route_names.dart';
import 'package:emcus_sathishkumar_r/core/utils/validators/input_validators.dart';
import 'package:emcus_sathishkumar_r/core/widgets/auth_rounded_card.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_bloc.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_event.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:emcus_sathishkumar_r/core/constants/assets/app_png_assets.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_fonts.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_button.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_text.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_text_field_title.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  var validationMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: _buildAppBar(size),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            }
      
            if (state is AuthFailure) {
              Navigator.of(context, rootNavigator: true).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
      
            if (state is AuthSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              // Navigate or show success
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login Successful!")),
              );
              Navigator.pushReplacementNamed(context, RouteNames.dashboard);
            }
          },
          builder: (context, state) {
            return AuthRoundedCard(
              child: Form(
                key: _formKey,
                autovalidateMode: validationMode,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle("Sign In"),
                      const SizedBox(height: 16),
                      _buildEmailField(),
                      const SizedBox(height: 14),
                      _buildPasswordField(),
                      const SizedBox(height: 14),
                      _buildRememberMeAndForgotPassword(),
                      const SizedBox(height: 24),
                      _buildSignInButton(size),
                      const SizedBox(height: 20),
                      _buildSignupText(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(Size size) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      title: Image.asset(AppPngAssets.appLogo, width: size.width / 2),
    );
  }

  Widget _buildTitle(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.humanst521BT,
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextFieldTitle(
      title: "Email Address",
      bodyTitleGap: 5,
      child: CustomTextField(
        controller: _emailController,
        hintText: "Enter your email address",
        prefixIconConstraints: const BoxConstraints(minHeight: 10),
        fillColor: const Color(0xffF5F5F5),
        validator: (value) => InputValidators.validateEmail(value),
      ),
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFieldTitle(
      title: "Password",
      bodyTitleGap: 5,
      child: CustomTextField(
        controller: _passwordController,
        hintText: "Enter your password",
        prefixIconConstraints: const BoxConstraints(minHeight: 10),
        fillColor: const Color(0xffF5F5F5),
        validator: (value) => InputValidators.validateLoginPassword(value),
        isObscureText: true,
      ),
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    color: rememberMe ? AppColors.primaryColor : Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Checkbox(
                value: rememberMe,
                onChanged: (value) {
                  setState(() => rememberMe = value ?? false);
                },
                activeColor: AppColors.secondaryColor,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 6),
            const CustomText("Remember me", fontSize: 16),
          ],
        ),
        InkWell(
          onTap: () {},
          child: CustomText(
            "Forgot Password?",
            color: AppColors.secondaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(Size size) {
    return Center(
      child: CustomButton(
        text: "Sign In",
        onTapped: () {
          if (_formKey.currentState!.validate()) {
            context.read<AuthBloc>().add(
                  AuthLoginRequested(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                    rememberMe: rememberMe,
                  ),
                );
          } else {
            validationMode = AutovalidateMode.always;
            BlocProvider.of<AuthBloc>(context).add(FormChangeEvent());
          }
        },
        borderRadius: 28,
        buttonWidth: size.width / 2.5,
      ),
    );
  }

  Widget _buildSignupText() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.humanst521BT,
          ),
          children: [
            TextSpan(
              text: 'Sign up here.',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, RouteNames.register);
                },
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.humanst521BT,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
