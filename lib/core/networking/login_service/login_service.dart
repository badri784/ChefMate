abstract class LoginService {
  Future createAccountWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future logInWithGoogle();
  Future logInWithFacebook();
}
