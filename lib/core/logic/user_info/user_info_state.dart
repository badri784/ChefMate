part of 'user_info_cubit.dart';

sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoSuccess extends UserInfoState {
  final String name;
  final String email;
  UserInfoSuccess({required this.name, required this.email});
}

final class UserInfoError extends UserInfoState {
  final String error;
  UserInfoError({required this.error});
}
