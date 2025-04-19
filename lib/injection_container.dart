import 'package:emcus_sathishkumar_r/core/utils/helpers/shared_preference.dart';
import 'package:emcus_sathishkumar_r/data/datasources/auth_remote_data_source.dart';
import 'package:emcus_sathishkumar_r/data/repositories/auth_repository_impl.dart';
import 'package:emcus_sathishkumar_r/domain/repositories/auth_repository.dart';
import 'package:emcus_sathishkumar_r/domain/usecases/login_user.dart';
import 'package:emcus_sathishkumar_r/domain/usecases/logout_user.dart';
import 'package:emcus_sathishkumar_r/domain/usecases/register_user.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Firebase
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Firestore
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  sl.registerLazySingleton(() => SharedPreferencesHelper());
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(
        loginUser: sl(),
        registerUser: sl(),
        logoutUser: sl(),
        firebaseAuth: sl(),
      ));
}
