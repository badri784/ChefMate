import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/dependance_injection/di.dart';
import 'package:food_app/core/networking/login_service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginService _loginService = getIt.get<LoginService>();
}
