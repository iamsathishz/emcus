// domain/usecases/login_user.dart
import 'package:dartz/dartz.dart';
import 'package:emcus_sathishkumar_r/core/exceptions/failure.dart';
import 'package:emcus_sathishkumar_r/domain/entities/user_entity.dart';
import 'package:emcus_sathishkumar_r/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return repository.login(email, password);
  }
}
