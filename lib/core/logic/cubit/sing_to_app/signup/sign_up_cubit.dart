import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/dependance_injection/di.dart';
import 'package:food_app/core/networking/login_service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final LoginService _loginService = getIt.get<LoginService>();
  final firebase = FirebaseAuth.instance;
  Future<void> createAccountWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      final Usercredential = await _loginService
          .createAccountWithEmailAndPassword(email: email, password: password);
      if (Usercredential != null) {
        emit(SignUpSuccess());
        debugPrint('▶️${Usercredential.user.toString()}');
      } else {
        emit(SignUpFailure(error: 'Something went wrong'));
      }

      final user = firebase.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'password': password,
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpFailure(error: 'The account already exists for that email.'),
        );
      } else {
        emit(SignUpFailure(error: e.message ?? 'Authentication failed.'));
      }
    } catch (e) {
      debugPrint(':::::::::::${e.toString()}');
      emit(SignUpFailure(error: e.toString()));
    }
  }
}
