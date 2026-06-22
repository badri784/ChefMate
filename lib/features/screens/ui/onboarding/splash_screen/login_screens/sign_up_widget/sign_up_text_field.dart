import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/features/screens/ui/onboarding/splash_screen/login_screens/splash-screen_logging_widget/custom_text_feiled.dart';

class SignUpTextField extends StatefulWidget {
  const SignUpTextField({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFeiled(
            controller: widget.nameController,
            hintText: 'Ahmed Elbadri',
            labelText: 'Full Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              if (value.length < 3) {
                return 'Name must be at least 3 characters long';
              }
              return null;
            },
          ),
          verticalSpace(15),
          CustomTextFeiled(
            controller: widget.emailController,
            hintText: 'you@example.com',
            labelText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(15),
          CustomTextFeiled(
            controller: widget.passwordController,
            hintText: '••••••••••',
            labelText: 'Password',
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
