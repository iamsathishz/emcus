class InputValidators {
  InputValidators._(); // Private constructor to prevent instantiation

  // Email Validator
  static String? validateEmail(String? value) {
    // Check if the email is not empty
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Check if the email format is valid
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // Return null if validation is successful
  }

  // Password Validator
  static String? validatePassword(String? value) {
    // Check if the password is not empty
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Check if password has at least 8 characters
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Check if the password contains at least one number
    final passwordRegex = RegExp(r'[0-9]');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    // Check if the password contains at least one letter
    final letterRegex = RegExp(r'[a-zA-Z]');
    if (!letterRegex.hasMatch(value)) {
      return 'Password must contain at least one letter';
    }
    return null; // Return null if validation is successful
  }

  // Password Validator
  static String? validateLoginPassword(String? value) {
    // Check if the password is not empty
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null; // Return null if validation is successful
  }

  // Name Validator
  static String? validateName(String? value) {
    // Check if the name is not empty
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    // Check if name contains only letters and spaces
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null; // Return null if validation is successful
  }

  // Confirm Password Validator
  static String? validateConfirmPassword(String? value, String password) {
    // Check if the confirm password is not empty
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    // Check if the confirm password matches the original password
    if (value != password) {
      return 'Passwords do not match';
    }
    return null; // Return null if validation is successful
  }
}
