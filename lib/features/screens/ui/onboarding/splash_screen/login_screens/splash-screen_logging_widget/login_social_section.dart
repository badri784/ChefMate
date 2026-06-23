import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/helpers/extension.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/logic/cubit/google_login/google_login_cubit.dart';
import 'package:food_app/core/routing/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../core/helpers/font_weght.dart';

class LoginSocialSection extends StatelessWidget {
  const LoginSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleLoginCubit, GoogleLoginState>(
      listener: (context, state) {
        if (state is GoogleLoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        }
        if (state is GoogleLoginFailure) {
          Navigator.of(context).pop(); // dismiss loading dialog
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
        if (state is GoogleLoginSuccess) {
          Navigator.of(context).pop(); // dismiss loading dialog
          context.pushReplacementName(Routes.home);
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
              horizontalSpace(5),
              Text(
                'OR CONNECT WITH',
                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              horizontalSpace(5),
              Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
            ],
          ),
          verticalSpace(20),
          const LoginSocialIcons(),
        ],
      ),
    );
  }
}

class LoginSocialIcons extends StatelessWidget {
  const LoginSocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleLoginCubit, GoogleLoginState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.read<GoogleLoginCubit>().loginWithGoogle();
              },
              child: state is GoogleLoginLoading
                  ? const CircularProgressIndicator()
                  : const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: FaIcon(FontAwesomeIcons.google),
                    ),
            ),
            horizontalSpace(12),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Color(0xff1877F2),
                child: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
