import 'package:dartz/dartz.dart';
import 'package:emcus_sathishkumar_r/core/exceptions/failure.dart';
import 'package:emcus_sathishkumar_r/domain/entities/user_entity.dart';
import 'package:emcus_sathishkumar_r/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String name,
    required String companyName,
  }) {
    return repository.register(
        email: email, password: password, name: name, companyName: companyName);
  }
}
