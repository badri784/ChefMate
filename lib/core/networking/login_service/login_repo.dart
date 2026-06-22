import 'package:firebase_auth/firebase_auth.dart';
import 'login_service.dart';

class LoginRepo implements LoginService {
  final FirebaseAuth _firebaseAuth;

  LoginRepo({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<UserCredential> createAccountWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future logInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future logInWithFacebook() {
    throw UnimplementedError();
  }
}
