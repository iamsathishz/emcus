import 'package:dartz/dartz.dart';
import 'package:emcus_sathishkumar_r/core/exceptions/failure.dart';
import 'package:emcus_sathishkumar_r/core/exceptions/firebase_exceptions.dart';
import 'package:emcus_sathishkumar_r/data/datasources/auth_remote_data_source.dart';
import 'package:emcus_sathishkumar_r/domain/entities/user_entity.dart';
import 'package:emcus_sathishkumar_r/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(FirebaseExceptionHandler.mapException(e)));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    required String name,
    required String companyName,
  }) async {
    try {
      final user = await remoteDataSource.register(
        email: email,
        password: password,
        name: name,
        companyName: companyName,
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(FirebaseExceptionHandler.mapException(e)));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
