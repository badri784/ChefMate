import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial()) {
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    emit(UserInfoLoading());
    try {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      final DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userData.exists) {
        final String name = userData.get('name');
        final String email = userData.get('email');

        log(name);
        emit(UserInfoSuccess(name: name, email: email));
      } else {
        emit(UserInfoError(error: 'User document not found'));
      }
    } catch (e) {
      emit(UserInfoError(error: e.toString()));
    }
  }
}
