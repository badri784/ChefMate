import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/dependance_injection/di.dart';
import 'package:food_app/core/networking/login_service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginService _loginService = getIt.get<LoginService>();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final Usercredential = await _loginService.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (Usercredential != null) {
        emit(LoginSuccess());
        debugPrint('▶️${Usercredential.user.toString()}');
      } else {
        emit(LoginFailure(error: 'Something went wrong'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(error: 'Wrong password provided for that user.'));
      } else {
        emit(LoginFailure(error: e.message ?? 'Authentication failed.'));
      }
    } catch (e) {
      debugPrint(':::::::::::${e.toString()}');
      emit(LoginFailure(error: e.toString()));
    }
  }
}
