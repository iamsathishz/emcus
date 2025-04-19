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
import 'package:emcus_sathishkumar_r/core/widgets/custom_text_field_title.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkTerms = false;
  final _nameController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var validationMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _nameController.dispose();
    _companyNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: _buildAppBar(size),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthRegisterLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          }

          if (state is AuthRegisterFailure) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is AuthRegisterSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            // Navigate or show success
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registeration Successful!")),
            );
            Navigator.pushReplacementNamed(context, RouteNames.login);
          }
        },
        builder: (context, state) {
          return AuthRoundedCard(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: validationMode,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle("Register"),
                    const SizedBox(height: 16),
                    _buildNameField(),
                    const SizedBox(height: 18),
                    _buildCompanyNameField(),
                    const SizedBox(height: 18),
                    _buildEmailField(),
                    const SizedBox(height: 18),
                    _buildPasswordField(),
                    const SizedBox(height: 18),
                    _buildConfirmPasswordField(),
                    const SizedBox(height: 18),
                    _buildTermsAndConditions(),
                    const SizedBox(height: 18),
                    _buildRegisterAndCancelButton(),
                    const SizedBox(height: 20),
                    _buildSignupText(),
                  ],
                ),
              ),
            ),
          );
        },
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
        onChanged: (_) {},
        hintText: "Enter your email address",
        prefixIconConstraints: const BoxConstraints(minHeight: 10),
        fillColor: const Color(0xffF5F5F5),
        validator: (value) => InputValidators.validateEmail(value),
      ),
    );
  }

  Widget _buildNameField() {
    return CustomTextFieldTitle(
      title: "Name",
      bodyTitleGap: 5,
      child: CustomTextField(
        controller: _nameController,
        hintText: "Enter your name",
        prefixIconConstraints: const BoxConstraints(minHeight: 10),
        fillColor: const Color(0xffF5F5F5),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Name is required";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildCompanyNameField() {
    return CustomTextFieldTitle(
      title: "Company Name",
      bodyTitleGap: 5,
      child: CustomTextField(
        controller: _companyNameController,
        onChanged: (_) {},
        hintText: "Enter your company name",
        prefixIconConstraints: const BoxConstraints(minHeight: 10),
        fillColor: const Color(0xffF5F5F5),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Company name is required";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFieldTitle(
      title: "Password",
      bodyTitleGap: 5,
      child: CustomTextField(
        controller: _passwordController,
        onChanged: (_) {},
        hintText: "Enter your password",
        prefixIconConstraints: const BoxConstraints(minHeight: 10),
        fillColor: const Color(0xffF5F5F5),
        validator: (value) => InputValidators.validatePassword(value),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextFieldTitle(
      title: "Confirm Password",
      bodyTitleGap: 5,
      child: CustomTextField(
        controller: _confirmPasswordController,
        onChanged: (_) {},
        hintText: "Enter your password",
        prefixIconConstraints: const BoxConstraints(minHeight: 10),
        fillColor: const Color(0xffF5F5F5),
        validator: (value) => InputValidators.validateConfirmPassword(
            value, _passwordController.text),
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: checkTerms ? AppColors.primaryColor : Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Checkbox(
            value: checkTerms,
            onChanged: (value) {
              checkTerms = value ?? false;
              BlocProvider.of<AuthBloc>(context).add(FormChangeEvent());
            },
            activeColor: AppColors.secondaryColor,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "By signing up you are agreeing with the FFE ",
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.humanst521BT,
              ),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.humanst521BT,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.humanst521BT,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.humanst521BT,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterAndCancelButton() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "Cancel",
            onTapped: () {
              Navigator.pop(context);
            },
            borderRadius: 28,
            buttonColor: AppColors.btnDisabledText.withOpacity(0.05),
            fontColor: AppColors.btnDisabledText,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: CustomButton(
            text: "Register",
            onTapped: () {
              if (_formKey.currentState?.validate() ?? false) {
                final name = _nameController.text.trim();
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                final company = _companyNameController.text.trim();
                if (checkTerms) {
                  // Dispatch the register event
                  BlocProvider.of<AuthBloc>(context).add(AuthRegisterEvent(
                    name: name,
                    email: email,
                    password: password,
                    companyName: company,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please check terms and conditions!")),
                  );
                }
              } else {
                validationMode = AutovalidateMode.always;
                BlocProvider.of<AuthBloc>(context).add(FormChangeEvent());
              }
            },
            borderRadius: 28,
          ),
        ),
      ],
    );
  }

  Widget _buildSignupText() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Already have account? ",
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.humanst521BT,
          ),
          children: [
            TextSpan(
              text: 'Sign in here.',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacementNamed(context, RouteNames.login);
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
