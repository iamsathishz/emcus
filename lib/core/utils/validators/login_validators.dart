import 'package:emcus_sathishkumar_r/core/utils/validators/input_validators.dart';

class LoginValidator {
  LoginValidator._(); // Private constructor to prevent instantiation

  // Login Validation
  static String? validateLogin(String? email, String? password) {
    // Validate email
    final emailError = InputValidators.validateEmail(email);
    if (emailError != null) {
      return emailError; // Return email validation error if any
    }

    // Validate password
    final passwordError = InputValidators.validatePassword(password);
    if (passwordError != null) {
      return passwordError; // Return password validation error if any
    }

    return null; // Return null if both validations are successful
  }
}
