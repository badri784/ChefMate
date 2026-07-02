import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helpers/extension.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/logic/cubit/sing_to_app_with_email_and_password/signup/sign_up_cubit.dart';
import 'package:food_app/core/routing/routes.dart';
import 'package:food_app/features/screens/ui/onboarding/splash_screen/login_screens/sign_up_widget/sign_up_header.dart';
import 'package:food_app/features/screens/ui/onboarding/splash_screen/login_screens/sign_up_widget/sign_up_social_buttons.dart';
import 'package:food_app/features/screens/ui/onboarding/splash_screen/login_screens/sign_up_widget/sign_up_text_field.dart';
import 'package:food_app/features/screens/ui/onboarding/splash_screen/login_screens/sign_up_widget/sign_up_create_button.dart';
import 'package:food_app/features/screens/ui/onboarding/splash_screen/login_screens/sign_up_widget/sign_up_footer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Account created successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            context.pushReplacementName(Routes.home);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SignUpHeader(),
                  const SignUpSocialButtons(),
                  verticalSpace(15),
                  SignUpTextField(
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    formKey: _formKey,
                  ),
                  verticalSpace(8),
                  const Text(
                    'Security strength',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  verticalSpace(25),
                  SignUpCreateButton(
                    nameController: _nameController,
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  verticalSpace(20),
                  const SignUpFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
