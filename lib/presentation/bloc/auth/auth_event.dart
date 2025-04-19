/// Base class for all authentication-related events.
abstract class AuthEvent {}

/// Triggered when a user attempts to log in.
class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  final bool rememberMe;

  /// [email] and [password] are the user's credentials.
  AuthLoginRequested({
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}

/// Triggered when a user submits the registration form.
class AuthRegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String companyName;

  /// Requires [name], [email], [password], and [companyName] for signup.
  AuthRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.companyName,
  });
}

/// Triggered when the "Remember Me" checkbox is toggled.
class RememberMeToggled extends AuthEvent {
  final bool isRemembered;

  RememberMeToggled(this.isRemembered);
}

/// Triggered when the user want to refresh
class FormChangeEvent extends AuthEvent {}

/// Triggered when a user attempts to log out.
class LoggedOut extends AuthEvent {}

class AppStarted extends AuthEvent {}
