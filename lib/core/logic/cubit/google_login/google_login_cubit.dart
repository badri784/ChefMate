import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit() : super(GoogleLoginInitial());

  Future<void> loginWithGoogle() async {
    emit(GoogleLoginLoading());
    try {
      // google_sign_in v7+ uses the singleton instance & authenticate()
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn.instance.authenticate();

      if (googleUser == null) {
        // User cancelled the sign-in
        emit(GoogleLoginFailure(message: 'Sign-in cancelled'));
        return;
      }

      // Obtain the ID token from the authenticated account
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential (idToken is sufficient for Firebase auth)
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(GoogleLoginSuccess());
    } catch (e) {
      emit(GoogleLoginFailure(message: e.toString()));
    }
  }
}

