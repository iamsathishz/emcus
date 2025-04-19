import 'package:firebase_auth/firebase_auth.dart';

/// A utility class to handle and map [FirebaseAuthException]
/// codes to user-friendly error messages for display to the user.
class FirebaseExceptionHandler {
  /// Maps a [FirebaseAuthException] to a readable error message.
  ///
  /// Takes a [FirebaseAuthException] [e] and returns a [String]
  /// message based on the error code.
  ///
  /// Supported error codes:
  /// - `invalid-email`: Invalid email format.
  /// - `user-disabled`: User account disabled.
  /// - `user-not-found`: No user associated with the given email.
  /// - `wrong-password`: Password does not match.
  /// - `email-already-in-use`: Email already registered.
  /// - `operation-not-allowed`: Sign-in method not enabled.
  /// - `weak-password`: Password strength too low.
  ///
  /// If the error code is unknown, it falls back to the exception's
  /// message or a generic fallback message.

  static String mapException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email is already associated with an account.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password provided is too weak.';
      default:
        return e.message ?? 'Authentication failed. Please try again later.';
    }
  }
}
