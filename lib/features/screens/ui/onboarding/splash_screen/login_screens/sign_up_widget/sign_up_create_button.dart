import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/sing_to_app_with_email_and_password/signup/sign_up_cubit.dart';

class SignUpCreateButton extends StatelessWidget {
  const SignUpCreateButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () async {
            final vaild = formKey.currentState!.validate();

            if (state is SignUpLoading) return;
            if (!vaild)
              return;
            else {
              await context
                  .read<SignUpCubit>()
                  .createAccountWithEmailAndPassword(
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffB02F00),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: state is SignUpLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text('Create Account'),
        );
      },
    );
  }
}
