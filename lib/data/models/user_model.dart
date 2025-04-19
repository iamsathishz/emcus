import 'package:emcus_sathishkumar_r/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email});

  factory UserModel.fromFirebase(User user) {
    return UserModel(uid: user.uid, email: user.email ?? '');
  }
}
