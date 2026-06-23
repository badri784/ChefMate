import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit() : super(GoogleLoginInitial());

  Future<UserCredential?> loginWithGoogle() async {
    emit(GoogleLoginLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final result = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      emit(GoogleLoginSuccess());
      return result;
    } catch (e) {
      emit(GoogleLoginFailure(message: e.toString()));
    }
    return null;
  }
}
