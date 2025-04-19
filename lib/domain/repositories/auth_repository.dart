import 'package:dartz/dartz.dart';
import 'package:emcus_sathishkumar_r/core/exceptions/failure.dart';
import 'package:emcus_sathishkumar_r/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);

  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    required String name,
    required String companyName,
  });
}
