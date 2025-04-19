import 'package:firebase_auth/firebase_auth.dart';

class LogoutUser {
  final FirebaseAuth _firebaseAuth;

  LogoutUser(this._firebaseAuth);

  Future<void> call() async {
    await _firebaseAuth.signOut();
  }
}
