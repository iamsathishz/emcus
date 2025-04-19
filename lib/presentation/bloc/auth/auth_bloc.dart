import 'package:emcus_sathishkumar_r/core/utils/helpers/shared_preference.dart';
import 'package:emcus_sathishkumar_r/domain/usecases/login_user.dart';
import 'package:emcus_sathishkumar_r/domain/usecases/logout_user.dart';
import 'package:emcus_sathishkumar_r/domain/usecases/register_user.dart';
import 'package:emcus_sathishkumar_r/injection_container.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_event.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [AuthBloc] handles authentication-related events such as login and registration.
/// It uses [LoginUser] and [RegisterUser] use cases to interact with Firebase Auth.

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final LogoutUser logoutUser;
  final FirebaseAuth firebaseAuth;

  /// Creates an instance of [AuthBloc] with required use cases.
  AuthBloc({
    required this.loginUser,
    required this.registerUser,
    required this.logoutUser,
    required this.firebaseAuth,
  }) : super(AuthInitial()) {
    on<AppStarted>(_onAppStart);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterEvent>(_onRegisterRequested);
    on<FormChangeEvent>((_, emit) => emit(FormChangeState()));
    on<LoggedOut>(_onLogout);
  }

  /// Handles login request by emitting loading state,
  /// then calling [LoginUser] use case and emitting result state.
  Future<void> _onLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginUser(event.email, event.password);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) async {
        emit(AuthSuccess(user));
        if (event.rememberMe) {
          await sl<SharedPreferencesHelper>().setRememberMe(true);
        } else {
          await sl<SharedPreferencesHelper>().setRememberMe(false);
        }
      },
    );
  }

  /// Handles register request by emitting loading state,
  /// then calling [RegisterUser] use case and emitting result state.
  Future<void> _onRegisterRequested(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthRegisterLoading());
    final result = await registerUser(
      email: event.email,
      password: event.password,
      name: event.name,
      companyName: event.companyName,
    );
    result.fold(
      (failure) => emit(AuthRegisterFailure(message: failure.message)),
      (user) => emit(AuthRegisterSuccess(user)),
    );
  }

  Future<void> _onAppStart(AppStarted event, Emitter<AuthState> emit) async {
    final user = firebaseAuth.currentUser;
    final rememberMe = await sl<SharedPreferencesHelper>().getRememberMe();
    if (user != null && rememberMe) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLogout(LoggedOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await logoutUser.call();
    await sl<SharedPreferencesHelper>().clearAll();
    emit(Unauthenticated());
  }
}
