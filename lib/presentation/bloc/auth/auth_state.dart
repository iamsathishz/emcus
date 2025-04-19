import 'package:emcus_sathishkumar_r/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Base class for all authentication-related states.
abstract class AuthState {}

/// Initial state before any action is taken.
class AuthInitial extends AuthState {}

/// State when authentication is in progress.
class AuthLoading extends AuthState {}

/// State when login is successful.
class AuthSuccess extends AuthState {
  final UserEntity user;

  /// Contains the authenticated [user] data.
  AuthSuccess(this.user);
}

/// State when login fails.
class AuthFailure extends AuthState {
  final String message;

  /// Error [message] explaining the failure.
  AuthFailure(this.message);
}

/// State when registration is in progress.
class AuthRegisterLoading extends AuthState {}

/// State when registration is successful.
class AuthRegisterSuccess extends AuthState {
  final UserEntity user;

  /// Contains the registered [user] data.
  AuthRegisterSuccess(this.user);
}

/// State when registration fails.
class AuthRegisterFailure extends AuthState {
  final String message;

  /// Error [message] explaining the registration failure.
  AuthRegisterFailure({required this.message});
}

/// State when the authentication form needs refresh.
class FormChangeState extends AuthState {}

/// State when logout
class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}
