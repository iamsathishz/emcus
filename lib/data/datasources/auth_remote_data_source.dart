import 'package:emcus_sathishkumar_r/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    required String companyName,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.firestore);

  @override
  Future<UserModel> login(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    required String companyName,
  }) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final String uid = userCredential.user!.uid;

    // Save additional data to Firestore
    await firestore.collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'companyName': companyName,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return UserModel.fromFirebase(userCredential.user!);
  }
}
