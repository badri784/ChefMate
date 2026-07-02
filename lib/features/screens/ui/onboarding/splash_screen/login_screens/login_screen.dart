import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/extension.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/logic/cubit/sing_to_app_with_email_and_password/login/login_cubit.dart';
import '../../../../../../core/routing/routes.dart';
import 'login_screen_widget/login_header.dart';
import 'login_screen_widget/login_text_fields.dart';
import 'login_screen_widget/login_button.dart';
import 'login_screen_widget/login_social_buttons.dart';
import 'login_screen_widget/login_footer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
          if (state is LoginLoading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state is LoginSuccess) {
            context.pushReplacementName(Routes.home);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 2),
                const LoginHeaderSection(),
                verticalSpace(25),
                LoginTextFields(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  formKey: _formKey,
                ),
                const Spacer(),
                LoginButton(
                  onPressed: () {
                    final validate = _formKey.currentState!.validate();
                    if (!validate) return;
                    context.read<LoginCubit>().signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  },
                ),
                const Spacer(),
                const LoginSocialButtons(),
                const Spacer(),
                const LoginFooter(),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
