import 'login_service.dart';

class LoginRepo implements LoginService {
  final LoginService loginService;
  LoginRepo(this.loginService);
  @override
  Future createAccountWithEmailAndPassword() {
    throw UnimplementedError();
  }

  @override
  Future logInWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future logInWithGoogle() {
    throw UnimplementedError();
  }
}
