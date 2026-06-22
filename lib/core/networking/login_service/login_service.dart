abstract class LoginService {
  Future createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future logInWithGoogle();
  Future logInWithFacebook();
  Future logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
